import 'package:flutter/material.dart';
import 'package:flutter_category/core/theme/text_theme.dart';
import 'package:flutter_category/core/utility/color_utility.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
    textTheme: textTheme,
    backgroundColor: ColorUtility.backgroundColor,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: ColorUtility.primaryColor,
        onPrimary: ColorUtility.primaryColor,
        secondary: ColorUtility.secondaryColor,
        onSecondary: ColorUtility.secondaryColor,
        error: ColorUtility.errorColor,
        onError: ColorUtility.errorColor,
        background: ColorUtility.backgroundColor,
        onBackground: ColorUtility.backgroundColor,
        surface: ColorUtility.offWhiteColor,
        onSurface: ColorUtility.offWhiteColor),
    appBarTheme: const AppBarTheme(elevation: 0,color: ColorUtility.appBarColor));
