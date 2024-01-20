import 'package:flutter/material.dart';

const colorsList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.yellow
];

class AppTheme {
  final int selectedColor;
  final bool isDarkTheme;

  AppTheme({this.selectedColor = 0, this.isDarkTheme = false})
      : assert(selectedColor >= 0 || selectedColor < colorsList.length,
            'Selected color must be greater than zero and lower than ${colorsList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorsList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true),
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkTheme}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme);
}
