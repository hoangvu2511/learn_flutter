import 'package:flutter/material.dart';

class CustomInputDecoration extends InputDecoration {
  final String label;
  final String hint;

  CustomInputDecoration({this.label, this.hint=""});

  @override
  String get labelText => label;

  @override
  TextStyle get labelStyle => TextStyle(color: Colors.black);

  @override
  InputBorder get errorBorder => CustomOutLine(Colors.red);

  @override
  InputBorder get border => CustomOutLine(Colors.blueGrey);

  @override
  InputBorder get focusedBorder => CustomOutLine();

  @override
  String get hintText => hint;

}

class CustomOutLine extends OutlineInputBorder {
  final MaterialColor colors;

  CustomOutLine([this.colors = Colors.pink]);

  @override
  BorderSide get borderSide => BorderSide(color: colors,);

  @override
  BorderRadius get borderRadius => BorderRadius.circular(10.0);
}
