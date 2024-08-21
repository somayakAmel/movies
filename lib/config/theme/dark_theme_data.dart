import 'package:flutter/material.dart';
import 'package:movies/constants/colors_cons.dart';
import 'package:flutter/services.dart';

class DarkThemeData {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: ColorsCons.backGroundColor,
        primaryColor: ColorsCons.primaryColor,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        textTheme: TextTheme(
            headlineLarge: TextStyle(
              color: ColorsCons.textPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            bodyLarge: TextStyle(
              color: ColorsCons.textPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            bodyMedium: TextStyle(
              color: ColorsCons.textPrimaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            bodySmall: TextStyle(
              color: ColorsCons.textPrimaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            labelLarge: TextStyle(
              color: ColorsCons.textSecondaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )),
        useMaterial3: true,
      );
}
