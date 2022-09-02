import 'package:flutter/material.dart';

Widget underHeadlineDecoration(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(200),
            border: Border.all(color: Colors.white)),
      ),
      Container(
        color: Colors.grey.shade600,
        width: MediaQuery.of(context).size.width * .8,
        height: 1,
      ),
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(200),
            border: Border.all(color: Colors.white)),
      ),
    ],
  );
}
