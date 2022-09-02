// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_paper/bloc/dnd_hydrated_bloc.dart';
import 'package:log_paper/function/screen_size.dart';
import 'package:log_paper/models/dnd.dart';
import 'package:log_paper/models/shift.dart';
import 'package:log_paper/screens/fifth_page.dart';
import 'package:log_paper/screens/pdf_preview_screen.dart';
import 'package:log_paper/widget/dnd_report.dart';
import 'package:log_paper/widget/underheadline_decoration.dart';

import '../style/colors.dart';

class ForthPage extends StatefulWidget {
  const ForthPage({Key? key}) : super(key: key);

  @override
  State<ForthPage> createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
  Dnd dnd1 = Dnd(
      title: 'DND LCC 100 ENGINE PERKIN 1006-6T',
      oilBearingTemp: 100,
      pressureDisch: 16,
      flowRate: 300,
      rpm: 1800,
      coolTemp: 100,
      oilTempPressure: "120",
      batteryVolt: 28,
      fuelRate: 0);
  Dnd dnd2 = Dnd(
      title: 'DND LCC 150 ENGINE VOLVO TAD1343VE',
      oilBearingTemp: 100,
      pressureDisch: 16,
      flowRate: 600,
      rpm: 1600,
      coolTemp: 98,
      oilTempPressure: "120",
      batteryVolt: 28,
      fuelRate: 0);
  Dnd dnd3 = Dnd(
      title: 'DND LCC 200 ENGINE VOLVO TAD1643VE',
      oilBearingTemp: 100,
      pressureDisch: 16,
      flowRate: 800,
      rpm: 1500,
      coolTemp: 98,
      oilTempPressure: "120",
      batteryVolt: 28,
      fuelRate: 0);
  Dnd dnd4 = Dnd(
      title: 'DND LCC 200 ENGINE SCANIA DC16',
      oilBearingTemp: 100,
      pressureDisch: 16,
      flowRate: 800,
      rpm: 2000,
      coolTemp: 105,
      oilTempPressure: "6b 87psi",
      batteryVolt: 28,
      fuelRate: 0);
  Dnd dnd5 = Dnd(
      title: 'DND LCC 200 ENGINE CAT C27',
      oilBearingTemp: 100,
      pressureDisch: 16,
      flowRate: 800,
      rpm: 1500,
      coolTemp: 100,
      oilTempPressure: "120",
      batteryVolt: 28,
      fuelRate: 0);
  Dnd dnd6 = Dnd(
      title: 'DND LSA 6 X 8 ENGINE CAT C27',
      oilBearingTemp: 100,
      pressureDisch: 20,
      flowRate: 600,
      rpm: 1600,
      coolTemp: 100,
      oilTempPressure: "120",
      batteryVolt: 28,
      fuelRate: 0);
  Dnd dnd7 = Dnd(
      title: 'DND LSA 6 X 8 ENGINE CAT C32',
      oilBearingTemp: 100,
      pressureDisch: 20,
      flowRate: 600,
      rpm: 1600,
      coolTemp: 100,
      oilTempPressure: "120",
      batteryVolt: 28,
      fuelRate: 0);
  Dnd dnd8 = Dnd(
      title: 'DND LSA 6 X 8 ENGINE CAT 3508',
      oilBearingTemp: 100,
      pressureDisch: 20,
      flowRate: 600,
      rpm: 1600,
      coolTemp: 100,
      oilTempPressure: "120",
      batteryVolt: 28,
      fuelRate: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DndHydratedBloc>(
      create: (_) => DndHydratedBloc(),
      child: BlocBuilder<DndHydratedBloc, DndState>(builder: (context, state) {
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
              ListView(
                shrinkWrap: true,
                children: [
                  DNDWidget(
                    title: "DND LCC 100 ENGINE PERKIN 1006-6T",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FifthPage(
                            dnd: dnd1,
                          ),
                        ),
                      );
                    },
                  ),
                  DNDWidget(
                    title: "DND LCC 150 ENGINE VOLVO TAD1343VE",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FifthPage(
                            dnd: dnd2,
                          ),
                        ),
                      );
                    },
                  ),
                  DNDWidget(
                    title: "DND LCC 200 ENGINE VOLVO TAD1643VE ",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FifthPage(
                            dnd: dnd3,
                          ),
                        ),
                      );
                    },
                  ),
                  DNDWidget(
                    title: "DND LCC 200 ENGINE SCANIA DC16",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FifthPage(
                            dnd: dnd4,
                          ),
                        ),
                      );
                    },
                  ),
                  DNDWidget(
                    title: "DND LCC 200 ENGINE CAT C27",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FifthPage(
                            dnd: dnd5,
                          ),
                        ),
                      );
                    },
                  ),
                  DNDWidget(
                    title: "DND LSA 6 X 8 ENGINE CAT C27",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FifthPage(
                            dnd: dnd6,
                          ),
                        ),
                      );
                    },
                  ),
                  DNDWidget(
                    title: "DND LSA 6 X 8 ENGINE CAT C32",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FifthPage(
                            dnd: dnd7,
                          ),
                        ),
                      );
                    },
                  ),
                  DNDWidget(
                    title: "DND LSA 6 X 8 ENGINE CAT 3508",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FifthPage(
                            dnd: dnd8,
                          ),
                        ),
                      );
                    },
                  )
                ],
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
                          Navigator.pop(context);
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
            ],
          ),
        )));
      }),
    );
  }
}
