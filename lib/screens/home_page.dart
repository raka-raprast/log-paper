import 'package:flutter/material.dart';
import 'package:log_paper/screens/login_page.dart';
import 'package:log_paper/style/colors.dart';

class LogPaperHome extends StatefulWidget {
  const LogPaperHome({Key? key}) : super(key: key);

  @override
  State<LogPaperHome> createState() => _LogPaperHomeState();
}

class _LogPaperHomeState extends State<LogPaperHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: darkTeal(), borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .15,
              child: Center(
                  child: Text(
                "Log Paper",
                style: TextStyle(
                    fontSize: 25, color: white(), fontWeight: FontWeight.bold),
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: skyBlue(), borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width * .15,
                height: MediaQuery.of(context).size.height * .025,
                child: Center(
                    child: Text(
                  "Masuk",
                  style: TextStyle(
                      fontSize: 10,
                      color: white(),
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        )),
      ),
    );
  }
}
