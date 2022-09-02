import 'package:flutter/material.dart';
import 'package:log_paper/style/colors.dart';

InputBorder outlineTextBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: darkBlue(),
      ),
      borderRadius: BorderRadius.circular(10));
}

InputBorder signInTextBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: black(),
      ),
      borderRadius: BorderRadius.circular(10));
}
