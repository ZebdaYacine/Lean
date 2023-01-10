import 'package:flutter/material.dart';

abstract class Themes {
  static ButtonStyle sampeleStyle = ButtonStyle(
      shadowColor: MaterialStateProperty.all(Colors.lightBlueAccent),
      fixedSize: MaterialStateProperty.all(const Size(200, 40)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      )));
}
