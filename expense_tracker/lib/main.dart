import 'package:expense_tracker/providers/expense_provider.dart';
import 'package:expense_tracker/screens/expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
      create: (context)=>ExpenseProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, themesProvider, child){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ExpenseScreen(),
        theme: themesProvider.theme,
        themeMode: ThemeMode.system,
      );   
      }
    );
  }
}