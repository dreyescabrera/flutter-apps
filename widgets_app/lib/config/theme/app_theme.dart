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

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 || selectedColor < colorsList.length,
            'Selected color must be greater than zero and lower than ${colorsList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorsList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true),
      );
}
