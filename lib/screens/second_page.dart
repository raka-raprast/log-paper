// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, avoid_function_literals_in_foreach_calls

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:log_paper/bloc/dnd_hydrated_bloc.dart';
import 'package:log_paper/bloc/image_hydrated_bloc.dart';
import 'package:log_paper/bloc/ongoing_hydrated_bloc.dart';
import 'package:log_paper/bloc/shift_hydrated_bloc.dart';
import 'package:log_paper/function/notifications.dart';
import 'package:log_paper/function/pdf_preview.dart';
import 'package:log_paper/function/screen_size.dart';
import 'package:log_paper/function/shift_time.dart';
import 'package:log_paper/models/custom_image.dart';
import 'package:log_paper/models/dnd.dart';
import 'package:log_paper/models/ongoing.dart';
import 'package:log_paper/models/shift.dart';
import 'package:log_paper/screens/forth_page.dart';
import 'package:log_paper/screens/pdf_preview_screen.dart';
import 'package:log_paper/screens/sixth_page.dart';
import 'package:log_paper/screens/third_page.dart';
import 'package:log_paper/style/colors.dart';
import 'package:log_paper/style/input_border.dart';
import 'package:log_paper/widget/custom_textfield.dart';
import 'package:log_paper/widget/shift_report.dart';
import 'package:log_paper/widget/underheadline_decoration.dart';

import '../main.dart';
import '../models/profile.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    Key? key,
    required this.ongoing,
    required this.profile,
    required this.dndList,
    required this.shiftList,
    required this.customImageList,
  }) : super(key: key);
  final Ongoing ongoing;
  final Profile profile;
  final List<Dnd> dndList;
  final List<Shift> shiftList;
  final List<CustomImage> customImageList;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Shift> shiftList = [];
  List<String> list = [];
  List<Dnd> dndMonitoringList = [];
  List<String> addedShift = [];
  TextEditingController hmAkhirController = TextEditingController();
  List<CustomImage> imageFiles = [];

  @override
  void initState() {
    if (widget.ongoing.shift == "Pagi") {
      setState(() {
        list = dayList;
      });
    } else {
      setState(() {
        list = nightList;
      });
    }
    setState(() {
      shiftList = widget.shiftList;
      dndMonitoringList = [
        Dnd(
            title: 'DND LCC 100 ENGINE PERKIN 1006-6T',
            oilBearingTemp: 100,
            pressureDisch: 16,
            flowRate: 300,
            rpm: 1800,
            coolTemp: 100,
            oilTempPressure: "120",
            batteryVolt: 28,
            fuelRate: 0),
        Dnd(
            title: 'DND LCC 150 ENGINE VOLVO TAD1343VE',
            oilBearingTemp: 100,
            pressureDisch: 16,
            flowRate: 600,
            rpm: 1600,
            coolTemp: 98,
            oilTempPressure: "120",
            batteryVolt: 28,
            fuelRate: 0),
        Dnd(
            title: 'DND LCC 200 ENGINE VOLVO TAD1643VE',
            oilBearingTemp: 100,
            pressureDisch: 16,
            flowRate: 800,
            rpm: 1500,
            coolTemp: 98,
            oilTempPressure: "120",
            batteryVolt: 28,
            fuelRate: 0),
        Dnd(
            title: 'DND LCC 200 ENGINE SCANIA DC16',
            oilBearingTemp: 100,
            pressureDisch: 16,
            flowRate: 800,
            rpm: 2000,
            coolTemp: 105,
            oilTempPressure: "6b 87psi",
            batteryVolt: 28,
            fuelRate: 0),
        Dnd(
            title: 'DND LCC 200 ENGINE CAT C27',
            oilBearingTemp: 100,
            pressureDisch: 16,
            flowRate: 800,
            rpm: 1500,
            coolTemp: 100,
            oilTempPressure: "120",
            batteryVolt: 28,
            fuelRate: 0),
        Dnd(
            title: 'DND LSA 6 X 8 ENGINE CAT C27',
            oilBearingTemp: 100,
            pressureDisch: 20,
            flowRate: 600,
            rpm: 1600,
            coolTemp: 100,
            oilTempPressure: "120",
            batteryVolt: 28,
            fuelRate: 0),
        Dnd(
            title: 'DND LSA 6 X 8 ENGINE CAT C32',
            oilBearingTemp: 100,
            pressureDisch: 20,
            flowRate: 600,
            rpm: 1600,
            coolTemp: 100,
            oilTempPressure: "120",
            batteryVolt: 28,
            fuelRate: 0),
        Dnd(
            title: 'DND LSA 6 X 8 ENGINE CAT 3508',
            oilBearingTemp: 100,
            pressureDisch: 20,
            flowRate: 600,
            rpm: 1600,
            coolTemp: 100,
            oilTempPressure: "120",
            batteryVolt: 28,
            fuelRate: 0),
      ];
      imageFiles = widget.customImageList;
      addedShift = widget.shiftList.map((e) => e.shiftTime).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<DndHydratedBloc>(create: (_) => DndHydratedBloc()),
            BlocProvider<ShiftHydratedBloc>(create: (_) => ShiftHydratedBloc()),
            BlocProvider<CustomImageHydratedBloc>(
                create: (_) => CustomImageHydratedBloc())
          ],
          child: BlocBuilder<ShiftHydratedBloc, ShiftState>(
              builder: (context, shiftState) {
            return BlocBuilder<DndHydratedBloc, DndState>(
                builder: (context, dndState) {
              return BlocBuilder<CustomImageHydratedBloc, CustomImageState>(
                  builder: (context, customImage) {
                return Scaffold(
                    body: Center(
                        child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.4, 0.8],
                          colors: [lightBlue(), darkBlue()])),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: screenHeight(context),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: grey().withOpacity(.3)),
                              height: screenHeight(context) * .65,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: SafeArea(
                                        child: Center(
                                      child: Text(
                                        "Log Paper",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )),
                                  ),
                                  underHeadlineDecoration(context),
                                  ListView(
                                    shrinkWrap: true,
                                    children: [
                                      ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: shiftList.length,
                                          itemBuilder: (context, i) {
                                            return GestureDetector(
                                              onTap: () async {
                                                var val = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ThirdPage(
                                                              shiftList: list,
                                                              shift:
                                                                  shiftList[i],
                                                              state:
                                                                  ThirdPageState
                                                                      .edit,
                                                            )));
                                                shiftList.removeWhere(
                                                    (element) =>
                                                        element.shiftTime ==
                                                        val.shiftTime);
                                                shiftList.add(val);

                                                setState(() {});
                                                if (widget.ongoing.shift ==
                                                    "Pagi") {
                                                  shiftList.sort((a, b) => int
                                                          .parse(a.shiftTime
                                                              .replaceAll(
                                                                  RegExp(
                                                                      r'[^\w\s]+'),
                                                                  ''))
                                                      .compareTo(int.parse(b
                                                          .shiftTime
                                                          .replaceAll(
                                                              RegExp(r'[^\w\s]+'),
                                                              ''))));
                                                } else {
                                                  shiftList.sort((a, b) => int
                                                          .parse(b.shiftTime
                                                              .replaceAll(
                                                                  RegExp(
                                                                      r'[^\w\s]+'),
                                                                  ''))
                                                      .compareTo(int.parse(a
                                                          .shiftTime
                                                          .replaceAll(
                                                              RegExp(r'[^\w\s]+'),
                                                              ''))));
                                                }
                                                BlocProvider.of<
                                                            ShiftHydratedBloc>(
                                                        context)
                                                    .add(ShiftAddEvent(
                                                        shiftList));
                                              },
                                              child: ShiftReportWidget(
                                                shift: shiftList[i],
                                              ),
                                            );
                                          }),
                                      if (list.isNotEmpty)
                                        TextButton(
                                            onPressed: () async {
                                              var val = await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              ThirdPage(
                                                                state:
                                                                    ThirdPageState
                                                                        .add,
                                                                shiftList: list
                                                                    .where((element) =>
                                                                        !addedShift
                                                                            .contains(element))
                                                                    .toList(),
                                                              )));
                                              if (val != null) {
                                                shiftList.add(val);
                                                addedShift.add(val.shiftTime);
                                                addedShift.toSet().toList();
                                                BlocProvider.of<
                                                            ShiftHydratedBloc>(
                                                        context)
                                                    .add(ShiftAddEvent(
                                                        shiftList));
                                                setState(() {});
                                              }
                                            },
                                            child: Text(
                                              "Add Report",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 100),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForthPage()));
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color:
                                                    black().withOpacity(.65)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text("DND Monitoring")),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 100),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        var val = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SixthPage(
                                                      imageFiles: imageFiles,
                                                    )));
                                        if (val != null) {
                                          setState(() {
                                            imageFiles = val;
                                            BlocProvider.of<
                                                        CustomImageHydratedBloc>(
                                                    context)
                                                .add(CustomImageAddEvent(val));
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color:
                                                    black().withOpacity(.65)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text("Add Photo")),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 100),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              BlocProvider<OngoingHydratedBloc>(
                                            create: (_) =>
                                                OngoingHydratedBloc(),
                                            child: BlocBuilder<
                                                OngoingHydratedBloc,
                                                OngoingState>(
                                              builder: (context, state) {
                                                return AlertDialog(
                                                  backgroundColor: darkBlue(),
                                                  title: const Text(
                                                      'Akhiri Shift?'),
                                                  content: SizedBox(
                                                    height:
                                                        screenHeight(context) *
                                                            .175,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                            'Pastikan kembali semua laporan sebelum mengakhiri shift'),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text("HM Akhir"),
                                                        TextField(
                                                            controller:
                                                                hmAkhirController),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child:
                                                          const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        showNotification(
                                                            "Shift diakhiri",
                                                            "Terima kasih kerja kerasnya hari ini!");
                                                        cancelAllNotifications();
                                                        BlocProvider.of<
                                                                    OngoingHydratedBloc>(
                                                                context)
                                                            .add(
                                                                OngoingRemoveEvent());
                                                        if (hmAkhirController
                                                            .text.isNotEmpty) {
                                                          createPDF(
                                                              context,
                                                              shiftList,
                                                              dndMonitoringList,
                                                              widget.ongoing,
                                                              widget.profile,
                                                              hmAkhirController
                                                                  .text,
                                                              imageFiles);
                                                        }
                                                      },
                                                      child: const Text(
                                                          'Akhiri Shift'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color:
                                                    black().withOpacity(.65)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text("End Shift")),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
              });
            });
          }),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
