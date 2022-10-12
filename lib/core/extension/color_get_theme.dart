import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension GetColorTheme on BuildContext {
 ColorScheme getColorTheme() {
    return Theme.of(this).colorScheme;
  }
}
