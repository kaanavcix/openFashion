import 'package:flutter/material.dart' ;
import 'package:flutter_category/core/utility/color_utility.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme =  TextTheme(
    titleLarge: GoogleFonts.tenorSans( 
        color: ColorUtility.textColor,
        fontSize: 18,
        letterSpacing: 4.0,
        wordSpacing: 1),
    titleMedium: GoogleFonts.tenorSans(
        color: ColorUtility.textColor,
        fontSize: 16,
        letterSpacing: 3.0,
        wordSpacing: 1),
    titleSmall: GoogleFonts.tenorSans(
        color: ColorUtility.textColor,
        fontSize: 14,
        letterSpacing: 2.0,
        wordSpacing: 1),
    bodyLarge: GoogleFonts.tenorSans(color: ColorUtility.bodyColor, fontSize: 16, wordSpacing: 1),
    bodyMedium: GoogleFonts.tenorSans(color: ColorUtility.bodyColor, fontSize: 14, wordSpacing: 1),
    bodySmall: GoogleFonts.tenorSans(color: ColorUtility.bodyColor, fontSize: 12, wordSpacing: 1));
