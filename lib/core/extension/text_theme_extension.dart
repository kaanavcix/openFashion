import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme getTextTheme() {
    return Theme.of(this).textTheme;
  }
}
