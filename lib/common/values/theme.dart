import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData appTheme = ThemeData(
    primaryColor: colors.primaryColor,
    accentColor: colors.accentColor,
    scaffoldBackgroundColor: colors.pageBackgroundColor,
    appBarTheme: AppBarTheme(
        color: colors.appbarBackgroundColor,
        iconTheme: IconThemeData(color: colors.iconsAppbarColor)),
    buttonTheme: ButtonThemeData(
        buttonColor: colors.buttonBackgroundColor,
        disabledColor: colors.buttonBackgroundDisableColor));