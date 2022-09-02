// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_paper/bloc/ongoing_hydrated_bloc.dart';
import 'package:log_paper/function/notifications.dart';
import 'package:log_paper/function/shift_time.dart';
import 'package:log_paper/models/ongoing.dart';
import 'package:log_paper/models/profile.dart';
import 'package:log_paper/screens/second_page.dart';
import 'package:log_paper/style/colors.dart';
import 'package:log_paper/style/input_border.dart';
import 'package:log_paper/widget/custom_textfield.dart';
import 'package:log_paper/widget/underheadline_decoration.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key, required this.profile}) : super(key: key);
  final Profile profile;
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController tahunController = TextEditingController();
  TextEditingController bulanController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController customerController = TextEditingController();
  TextEditingController noPompaController = TextEditingController();
  TextEditingController hmAwalController = TextEditingController();
  TextEditingController lokasiController = TextEditingController();
  var items = [
    'Pagi',
    'Malam',
  ]; // Initial Selected Value
  String dropdownvalue = 'Pagi';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
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
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton(
                        dropdownColor: darkBlue(),
                        isExpanded: true,
                        style: TextStyle(color: Colors.white),
                        underline: Container(),
                        value: dropdownvalue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  CustomTextField(title: "Tahun", controller: tahunController),
                  CustomTextField(title: "Bulan", controller: bulanController),
                  CustomTextField(
                      title: "Tanggal", controller: tanggalController),
                  CustomTextField(
                      title: "Customer", controller: customerController),
                  CustomTextField(
                      title: "No. Pompa", controller: noPompaController),
                  CustomTextField(
                      title: "HM Awal", controller: hmAwalController),
                  CustomTextField(
                      title: "Lokasi", controller: lokasiController),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  BlocProvider<OngoingHydratedBloc>(
                                create: (_) => OngoingHydratedBloc(),
                                child: BlocBuilder<OngoingHydratedBloc,
                                        OngoingState>(
                                    builder: (context, state) => AlertDialog(
                                          backgroundColor: darkBlue(),
                                          title: Text('Mulai Shift?'),
                                          content: Text(
                                              "Pastikan kembali inputan sebelum memulai shift"),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                showNotification(
                                                    "Shift dimulai",
                                                    "Jaga diri anda dan berhati-hati lah. tetap safety!");
                                                repeatNotification();
                                                BlocProvider
                                                        .of<
                                                                OngoingHydratedBloc>(
                                                            context)
                                                    .add(OngoingAddEvent(
                                                        Ongoing(
                                                            shift:
                                                                dropdownvalue,
                                                            tahun:
                                                                tahunController
                                                                    .text,
                                                            bulan:
                                                                bulanController
                                                                    .text,
                                                            tanggal:
                                                                tanggalController
                                                                    .text,
                                                            customer:
                                                                customerController
                                                                    .text,
                                                            noPompa:
                                                                noPompaController
                                                                    .text,
                                                            hmAwal:
                                                                hmAwalController
                                                                    .text,
                                                            lokasi:
                                                                lokasiController
                                                                    .text)));
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SecondPage(
                                                      ongoing: Ongoing(
                                                          shift: dropdownvalue,
                                                          tahun: tahunController
                                                              .text,
                                                          bulan: bulanController
                                                              .text,
                                                          tanggal:
                                                              tanggalController
                                                                  .text,
                                                          customer:
                                                              customerController
                                                                  .text,
                                                          noPompa:
                                                              noPompaController
                                                                  .text,
                                                          hmAwal:
                                                              hmAwalController
                                                                  .text,
                                                          lokasi:
                                                              lokasiController
                                                                  .text),
                                                      profile: widget.profile,
                                                      dndList: [],
                                                      shiftList: [],
                                                      customImageList: [],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        )),
                              ),
                            );
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: black().withOpacity(.65)),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(child: Text("Start Shift")),
                          ),
                        ),
                      ))
                ],
              ),
            ))),
        onWillPop: () async {
          return false;
        });
  }
}
