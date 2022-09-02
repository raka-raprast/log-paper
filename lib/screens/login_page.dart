// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_paper/bloc/profile_hydrated_bloc.dart';
import 'package:log_paper/models/profile.dart';
import 'package:log_paper/screens/first_page.dart';

import '../style/colors.dart';
import '../style/input_border.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberMe = false;
  bool verificator = true;
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogProfileHydratedBloc>(
      create: (_) => LogProfileHydratedBloc(),
      child: BlocBuilder<LogProfileHydratedBloc, LogProfileState>(
          builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white().withOpacity(0.65),
                ),
                child: TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    enabledBorder: signInTextBorder(),
                    focusedBorder: signInTextBorder(),
                  ),
                  onChanged: (s) {
                    setState(() {
                      verificator = true;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white().withOpacity(0.65),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controllerId,
                  decoration: InputDecoration(
                    labelText: "ID",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    enabledBorder: signInTextBorder(),
                    focusedBorder: signInTextBorder(),
                  ),
                  onChanged: (s) {
                    setState(() {
                      verificator = true;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Checkbox(
                      checkColor: black(),
                      activeColor: darkTeal(),
                      value: rememberMe,
                      onChanged: (val) {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      }),
                  Text(
                    "Remember me",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            if (!verificator)
              Center(
                child: Text(
                  "Ada field yang kosong!",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Material(
                  color: darkTeal(),
                  child: InkWell(
                    onTap: () {
                      if (controllerNama.text.isNotEmpty &&
                          controllerId.text.isNotEmpty) {
                        if (rememberMe) {
                          BlocProvider.of<LogProfileHydratedBloc>(context).add(
                              LogProfileAddEvent(Profile(
                                  nama: controllerNama.text,
                                  id: controllerId.text)));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage(
                                        profile: Profile(
                                            nama: controllerNama.text,
                                            id: controllerId.text),
                                      )));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage(
                                        profile: Profile(
                                            nama: controllerNama.text,
                                            id: controllerId.text),
                                      )));
                        }
                      } else {
                        setState(() {
                          verificator = false;
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                          child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 25),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ])),
        );
      }),
    );
  }
}
