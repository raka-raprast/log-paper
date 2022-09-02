// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:log_paper/style/colors.dart';

class DNDWidget extends StatelessWidget {
  const DNDWidget({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: darkGrey().withOpacity(.65),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 11),
            ),
            RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
