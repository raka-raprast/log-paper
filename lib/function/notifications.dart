import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

Future<void> showNotification(String title, String body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('your channel id', 'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin
      .show(0, title, body, platformChannelSpecifics, payload: '');
}

Future<void> repeatNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'repeating channel id', 'repeating channel name',
          channelDescription: 'repeating description');
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'Reminder',
      'Mohon untuk tidak lupa mengisi report hari ini',
      RepeatInterval.hourly,
      platformChannelSpecifics,
      androidAllowWhileIdle: true);
}

Future<void> cancelAllNotifications() async {
  await flutterLocalNotificationsPlugin.cancelAll();
}
