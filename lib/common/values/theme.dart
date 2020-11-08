import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart' as colors;

ThemeData appTheme(context) => ThemeData(
    primaryColor: colors.primaryColor,
    accentColor: colors.accentColor,
    scaffoldBackgroundColor: colors.pageBackgroundColor,
    textTheme: GoogleFonts.nunitoTextTheme(
      Theme.of(context).textTheme,
    ),
    appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        centerTitle: true,
        color: colors.appbarBackgroundColor,
        iconTheme: IconThemeData(color: colors.iconsAppbarColor)),
    buttonTheme: ButtonThemeData(
        buttonColor: colors.buttonBackgroundColor,
        disabledColor: colors.buttonBackgroundDisableColor));
