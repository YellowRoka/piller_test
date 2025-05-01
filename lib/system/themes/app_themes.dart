
import 'package:flutter/material.dart';
import 'package:piller_test/system/themes/app_colors.dart';

ThemeData appTheme = ThemeData(
  textTheme: TextTheme(
    bodyLarge: const TextStyle(
      fontSize:   24,
      fontWeight: FontWeight.normal,
      color:      textColor
    ),
    bodyMedium: const TextStyle(
      fontSize:   18,
      fontWeight: FontWeight.normal,
      color:      textColor
    ),
    bodySmall: const TextStyle(
      fontSize:   16,
      fontWeight: FontWeight.normal,
      color:      textColor
    ),
  ),

  dividerTheme: const DividerThemeData(
    color: dividerColor,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation:        0,
      shadowColor:     buttonShadowColor,
      foregroundColor: buttonTextColor,
      backgroundColor: buttonColor,
    ),
  ),

  scaffoldBackgroundColor: appBackgroundColor,
  cardColor:               cardBGColor,
);