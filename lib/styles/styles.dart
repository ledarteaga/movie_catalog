import 'package:flutter/material.dart';

class AppColors {
  static const Color scaffoldBackground = Colors.black45;
  static const Color appBarBackground = Colors.black45;
  static const Color textColor = Colors.white;
  static const Color iconColor = Colors.white;
  static const Color buttonBackground = Colors.red;
}

ThemeData AppTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.buttonBackground,
  ),
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
    iconColor: WidgetStatePropertyAll(AppColors.iconColor),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(AppColors.iconColor),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(color: Colors.amber),
          ))),
  filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(AppColors.buttonBackground))),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.scaffoldBackground,
    titleTextStyle: TextStyle(
        color: AppColors.textColor, fontSize: 20, fontWeight: FontWeight.bold),
    actionsIconTheme: IconThemeData(color: AppColors.iconColor),
    iconTheme: IconThemeData(color: AppColors.iconColor),
  ),
  iconTheme: const IconThemeData(color: AppColors.iconColor),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textColor),
    bodyMedium: TextStyle(color: AppColors.textColor),
    bodySmall: TextStyle(color: AppColors.textColor),
    titleSmall: TextStyle(color: AppColors.textColor),
    titleMedium: TextStyle(color: AppColors.textColor),
    titleLarge: TextStyle(color: AppColors.textColor),
    headlineLarge:
        TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
    headlineMedium:
        TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
  ),
  chipTheme: const ChipThemeData(
      backgroundColor: AppColors.buttonBackground,
      labelStyle: TextStyle(color: AppColors.textColor)),
  cardTheme: const CardTheme(
    color: AppColors.scaffoldBackground,
  ),
  dividerTheme:
      const DividerThemeData(color: Color.fromARGB(105, 162, 162, 162)),
);
