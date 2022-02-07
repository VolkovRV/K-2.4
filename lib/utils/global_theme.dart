
import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
  fontFamily: 'Georgia',
  splashColor: Colors.white,

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
  ).copyWith(
    secondary: Colors.blue,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 30.0, color: Colors.white, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Hind', color: Colors.indigo),
  ),
);