// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:log_paper/models/shift.dart';
import 'package:log_paper/style/colors.dart';

class ShiftReportWidget extends StatelessWidget {
  const ShiftReportWidget({Key? key, required this.shift}) : super(key: key);
  final Shift shift;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: darkGrey().withOpacity(.65),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            shift.shiftTime,
            style: TextStyle(color: Colors.white),
          ),
          RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
