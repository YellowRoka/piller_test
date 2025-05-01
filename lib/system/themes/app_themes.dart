
import 'package:flutter/material.dart';
import 'package:piller_test/system/themes/app_colors.dart';

const loginSuccesLineStyle = TextStyle(
  color: buttonTextColor
);

const baseBorderSideStyleOnDataField = BorderSide(
  color: fieldBorderColor, 
  width: 2,
);

const focusedBorderSideStyleOnDataField = BorderSide(
  color: fieldFocusColor, 
  width: 2,
);

const errorTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const searchLineDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color:      searchBoxShadowColor,
      blurRadius:   10,
      spreadRadius: 10
    )
  ], 
  gradient: LinearGradient(
    begin:  Alignment.topCenter, 
    end:    Alignment.bottomCenter, 
    colors: searchBarBGColors
  ),
);

ButtonStyle  messageCardStyle = ElevatedButton.styleFrom( 
  backgroundColor: baseColor1, 
);

const messageCardTextStyle = TextStyle(
   color: baseColor2, 
   fontSize: 20
);

final ThemeData appTheme = ThemeData(
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