// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:log_paper/style/colors.dart';
import 'package:log_paper/style/input_border.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.title,
      required this.controller,
      this.keyboardType,
      this.readOnly = false})
      : super(key: key);
  final String title;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: darkGrey().withOpacity(0.65),
            ),
            child: TextField(
              readOnly: readOnly,
              style: TextStyle(color: Colors.white),
              controller: controller,
              keyboardType: keyboardType ?? TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: outlineTextBorder(),
                focusedBorder: outlineTextBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
