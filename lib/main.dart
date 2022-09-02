// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:http/http.dart' as http;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image/image.dart' as image;
import 'package:log_paper/bloc/dnd_hydrated_bloc.dart';
import 'package:log_paper/bloc/image_hydrated_bloc.dart';
import 'package:log_paper/bloc/ongoing_hydrated_bloc.dart';
import 'package:log_paper/bloc/profile_hydrated_bloc.dart';
import 'package:log_paper/screens/first_page.dart';
import 'package:log_paper/screens/home_page.dart';
import 'package:log_paper/screens/second_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'bloc/shift_hydrated_bloc.dart';

// void main() {
//   runApp(const LogPaperApp());
// }

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

String? selectedNotificationPayload;

/// IMPORTANT: running the following code on its own won't work as there is
/// setup required for each platform head project.
///
/// Please download the complete example app from the GitHub repository where
/// all the setup has been done
Future<void> main() async {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();

  await _configureLocalTimeZone();

  final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
          Platform.isLinux
      ? null
      : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    selectedNotificationPayload = notificationAppLaunchDetails!.payload;
  }

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // /// Note: permissions aren't requested here just to demonstrate that can be
  // /// done later
  // final IOSInitializationSettings initializationSettingsIOS =
  //     IOSInitializationSettings(
  //         requestAlertPermission: false,
  //         requestBadgePermission: false,
  //         requestSoundPermission: false,
  //         onDidReceiveLocalNotification: (
  //           int id,
  //           String? title,
  //           String? body,
  //           String? payload,
  //         ) async {
  //           didReceiveLocalNotificationSubject.add(
  //             ReceivedNotification(
  //               id: id,
  //               title: title,
  //               body: body,
  //               payload: payload,
  //             ),
  //           );
  //         });
  // const MacOSInitializationSettings initializationSettingsMacOS =
  //     MacOSInitializationSettings(
  //   requestAlertPermission: false,
  //   requestBadgePermission: false,
  //   requestSoundPermission: false,
  // );
  // final LinuxInitializationSettings initializationSettingsLinux =
  //     LinuxInitializationSettings(
  //   defaultActionName: 'Open notification',
  //   defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
  // );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    // iOS: initializationSettingsIOS,
    // macOS: initializationSettingsMacOS,
    // linux: initializationSettingsLinux,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    selectedNotificationPayload = payload;
    selectNotificationSubject.add(payload);
  });
  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(LogPaperApp()),
    storage: storage,
  );
}

Future<void> _configureLocalTimeZone() async {
  if (kIsWeb || Platform.isLinux) {
    return;
  }
  tz.initializeTimeZones();
  final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

class LogPaperApp extends StatelessWidget {
  const LogPaperApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log Paper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<LogProfileHydratedBloc>(
            create: (_) =>
                LogProfileHydratedBloc()..add(LogProfileCheckEvent())),
        BlocProvider<OngoingHydratedBloc>(
            create: (_) => OngoingHydratedBloc()..add(OngoingCheckEvent())),
        BlocProvider<DndHydratedBloc>(
            create: (_) => DndHydratedBloc()..add(DndCheckEvent())),
        BlocProvider<ShiftHydratedBloc>(
            create: (_) => ShiftHydratedBloc()..add(ShiftCheckEvent())),
        BlocProvider<CustomImageHydratedBloc>(
            create: (_) =>
                CustomImageHydratedBloc()..add(CustomImageCheckEvent()))
      ], child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    _requestPermissions();
    _configureSelectNotificationSubject();
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String? payload) async {
      await Navigator.pushNamed(context, '/secondPage');
    });
  }

  @override
  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogProfileHydratedBloc, LogProfileState>(
        builder: (context, stateProfile) {
      return BlocBuilder<OngoingHydratedBloc, OngoingState>(
          builder: (context, stateOngoing) {
        if (stateProfile.profile.isNotEmpty) {
          if (stateOngoing is OngoingChangeState &&
              stateOngoing.ongoing.isNotEmpty) {
            return BlocBuilder<DndHydratedBloc, DndState>(
                builder: (context, stateDnd) {
              return BlocBuilder<ShiftHydratedBloc, ShiftState>(
                  builder: (context, stateShift) {
                return BlocBuilder<CustomImageHydratedBloc, CustomImageState>(
                    builder: (context, stateImg) {
                  return SecondPage(
                    ongoing: stateOngoing.ongoing.first,
                    profile: stateProfile.profile.first,
                    dndList: stateDnd.dnd,
                    shiftList: stateShift.shift,
                    customImageList: stateImg.customImage,
                  );
                });
              });
            });
          }
          return FirstPage(profile: stateProfile.profile.first);
        }
        return LogPaperHome();
      });
    });
  }
}
