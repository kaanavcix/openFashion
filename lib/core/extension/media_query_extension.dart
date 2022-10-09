import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double getWidth(double size) {
    return MediaQuery.of(this).size.width * size;
  }

  double getHeight(double size) {
    return MediaQuery.of(this).size.height * size;
  }
}
