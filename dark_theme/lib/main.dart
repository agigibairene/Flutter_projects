// ignore_for_file: prefer_const_constructors

import 'package:dark_theme/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme toggle',
      theme: lightMode,
    );
  }
}

