import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:log_paper/models/dnd.dart';
import 'package:log_paper/style/colors.dart';
import 'package:log_paper/widget/custom_textfield.dart';
import 'package:log_paper/widget/underheadline_decoration.dart';

import '../models/shift.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({Key? key, required this.dnd}) : super(key: key);
  final Dnd dnd;
  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  TextEditingController oilBTempController = TextEditingController();
  TextEditingController pressureDController = TextEditingController();
  TextEditingController flowRateController = TextEditingController();
  TextEditingController rpmController = TextEditingController();
  TextEditingController coolTempController = TextEditingController();
  TextEditingController oilTempPressureController = TextEditingController();
  TextEditingController batteryVController = TextEditingController();
  TextEditingController fuelRateController = TextEditingController();
  @override
  void initState() {
    setState(() {
      oilBTempController.text = widget.dnd.oilBearingTemp.toString();
      pressureDController.text = widget.dnd.pressureDisch.toString();
      flowRateController.text = widget.dnd.flowRate.toString();
      rpmController.text = widget.dnd.rpm.toString();
      coolTempController.text = widget.dnd.coolTemp.toString();
      oilTempPressureController.text = widget.dnd.oilTempPressure.toString();
      batteryVController.text = widget.dnd.batteryVolt.toString();
      fuelRateController.text = widget.dnd.fuelRate.toString();
    });
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
      child: ListView(children: [
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
        Center(child: Text(widget.dnd.title)),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        CustomTextField(
          title: "Oil Bearing Temp",
          controller: oilBTempController,
          keyboardType: TextInputType.number,
          readOnly: true,
        ),
        CustomTextField(
          title: "Pressure Disch",
          controller: pressureDController,
          keyboardType: TextInputType.number,
          readOnly: true,
        ),
        CustomTextField(
          title: "Flowrate",
          controller: flowRateController,
          keyboardType: TextInputType.number,
          readOnly: true,
        ),
        CustomTextField(
          title: "RPM",
          controller: rpmController,
          keyboardType: TextInputType.number,
          readOnly: true,
        ),
        CustomTextField(
          title: "Cool Temp",
          controller: coolTempController,
          keyboardType: TextInputType.number,
          readOnly: true,
        ),
        CustomTextField(
          title: "Oil temp/Oil Pressure",
          controller: oilTempPressureController,
          keyboardType: TextInputType.number,
          readOnly: true,
        ),
        CustomTextField(
          title: "Battery Volt",
          controller: batteryVController,
          keyboardType: TextInputType.number,
          readOnly: true,
        ),
        CustomTextField(
          title: "Fuel Rate",
          controller: fuelRateController,
          keyboardType: TextInputType.number,
          readOnly: true,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(
                        context,
                        Dnd(
                          title: widget.dnd.title,
                          batteryVolt: int.parse(batteryVController.text),
                          flowRate: int.parse(flowRateController.text),
                          coolTemp: int.parse(coolTempController.text),
                          fuelRate: int.parse(fuelRateController.text),
                          oilBearingTemp: int.parse(oilBTempController.text),
                          oilTempPressure: oilTempPressureController.text,
                          pressureDisch: int.parse(pressureDController.text),
                          rpm: int.parse(rpmController.text),
                        ));
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: black().withOpacity(.65)),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(child: Text("Done")),
                  ),
                ),
              ),
            )),
      ]),
    )));
  }
}
