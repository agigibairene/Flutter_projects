// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primaryFixed: Colors.grey[700],
    secondaryFixed: Colors.grey[600]
  ),
);

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primaryFixed: Colors.grey[300],
    secondaryFixed: Colors.grey[200] 
  )
);
