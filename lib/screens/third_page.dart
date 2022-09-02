// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:log_paper/function/shift_time.dart';
import 'package:log_paper/models/ongoing.dart';
import 'package:log_paper/models/shift.dart';
import 'package:log_paper/screens/second_page.dart';
import 'package:log_paper/style/colors.dart';
import 'package:log_paper/style/input_border.dart';
import 'package:log_paper/widget/custom_textfield.dart';
import 'package:log_paper/widget/underheadline_decoration.dart';

enum ReportState { firstState, secondState }

enum ThirdPageState { edit, add }

class ThirdPage extends StatefulWidget {
  const ThirdPage(
      {Key? key, required this.shiftList, this.shift, required this.state})
      : super(key: key);
  final List<String> shiftList;
  final Shift? shift;
  final ThirdPageState state;
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController oilBTempController = TextEditingController();
  TextEditingController pressureDController = TextEditingController();
  TextEditingController flowRateController = TextEditingController();
  TextEditingController rpmController = TextEditingController();
  TextEditingController coolTempController = TextEditingController();
  TextEditingController oilTempPressureController = TextEditingController();
  TextEditingController batteryVController = TextEditingController();
  TextEditingController fuelRateController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  String dropdownvalue = '';
  ReportState state = ReportState.firstState;
  List<String> status = ['Running Operasi', 'B.Down Rusak', 'Standby'];
  String statusValue = 'Running Operasi';
  @override
  void initState() {
    setState(() {
      dropdownvalue = widget.shiftList.first;
    });
    if (widget.shift != null) {
      setState(() {
        oilBTempController.text = widget.shift!.oilBearingTemp.toString();
        pressureDController.text = widget.shift!.pressureDisch.toString();
        flowRateController.text = widget.shift!.flowRate.toString();
        rpmController.text = widget.shift!.rpm.toString();
        coolTempController.text = widget.shift!.coolTemp.toString();
        oilTempPressureController.text =
            widget.shift!.oilTempPressure.toString();
        batteryVController.text = widget.shift!.batteryVolt.toString();
        fuelRateController.text = widget.shift!.fuelRate.toString();
        remarkController.text = widget.shift!.remarkKeterangan.toString();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      child: state == ReportState.firstState ? _buildFirst() : _buildSecond(),
    )));
  }

  Widget _buildFirst() {
    return ListView(
      // ignore: prefer_const_literals_to_create_immutables
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
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Shift",
            style: TextStyle(fontSize: 15),
          ),
        ),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: darkGrey().withOpacity(0.65),
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton(
              dropdownColor: darkBlue(),
              isExpanded: true,
              style: TextStyle(color: Colors.white),
              underline: Container(),
              value: widget.state == ThirdPageState.add
                  ? dropdownvalue
                  : widget.shift!.shiftTime,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              items: widget.shiftList.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Status",
            style: TextStyle(fontSize: 15),
          ),
        ),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: darkGrey().withOpacity(0.65),
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton(
              dropdownColor: darkBlue(),
              isExpanded: true,
              style: TextStyle(color: Colors.white),
              underline: Container(),
              value: statusValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              items: status.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  statusValue = newValue!;
                });
              },
            ),
          ),
        ),
        CustomTextField(
          title: "Oil Bearing Temp",
          controller: oilBTempController,
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
          title: "Pressure Disch",
          controller: pressureDController,
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
          title: "Flowrate",
          controller: flowRateController,
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
          title: "RPM",
          controller: rpmController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: black().withOpacity(.65)),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text("Back")),
                ),
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    state = ReportState.secondState;
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: black().withOpacity(.65)),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text("Next")),
                ),
              ),
            ))
      ],
    );
  }

  Widget _buildSecond() {
    return ListView(
      // ignore: prefer_const_literals_to_create_immutables
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
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        CustomTextField(
          title: "Cool Temp",
          controller: coolTempController,
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
          title: "Oil temp/Oil Pressure",
          controller: oilTempPressureController,
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
          title: "Battery Volt",
          controller: batteryVController,
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
          title: "Fuel Rate",
          controller: fuelRateController,
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
            title: "Remark Keterangan", controller: remarkController),
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    state == ReportState.firstState;
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: black().withOpacity(.65)),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text("Back")),
                ),
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pop(
                      context,
                      Shift(
                          batteryVolt: int.parse(batteryVController.text),
                          flowRate: int.parse(flowRateController.text),
                          coolTemp: int.parse(coolTempController.text),
                          fuelRate: int.parse(fuelRateController.text),
                          oilBearingTemp: int.parse(oilBTempController.text),
                          oilTempPressure:
                              int.parse(oilTempPressureController.text),
                          pressureDisch: int.parse(pressureDController.text),
                          remarkKeterangan: remarkController.text,
                          rpm: int.parse(rpmController.text),
                          shiftTime: dropdownvalue,
                          status: statusValue));
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: black().withOpacity(.65)),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text("Done")),
                ),
              ),
            )),
      ],
    );
  }
}
