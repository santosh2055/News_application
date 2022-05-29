import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final appThemData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.deepOrange,
      backgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w300,
        ),
        bodyText2: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: Colors.teal,
      backgroundColor: Colors.black,
      textTheme: TextTheme(
        bodyText1: GoogleFonts.nunito(
          color: Colors.black87,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        bodyText2: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
