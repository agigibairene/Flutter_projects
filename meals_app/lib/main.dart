import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/providers/fav_meal.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/homepage.dart';
import 'package:provider/provider.dart';

final theme = ThemeData(
  // useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>FavMealProvider()),
        ChangeNotifierProvider(create: (context)=>FiltersProvider())
      ],
      child: const App(),
    )
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/home': (context)=>HomePage(),
        '/filters': (context)=>Filters()
      },
    );
  }
}

