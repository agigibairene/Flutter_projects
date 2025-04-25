import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseProvider extends ChangeNotifier{

  ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade200,
      primary: Colors.deepPurple,
      secondary: Colors.deepPurpleAccent.shade100,
      onSecondary: Colors.black
    )
  );


  ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: const Color.fromARGB(255, 27, 27, 27),
      primary: Colors.black,
      secondary: const Color.fromARGB(255, 7, 68, 77),
      onSecondary: Colors.white
    )
  );

  ThemeData _theme = ThemeData.light();

  ThemeData get theme => _theme;

  void toggleTheme(){
   if (_theme == lightMode){
    _theme = darkMode;
   }
   else{
    _theme = lightMode;
   }
   notifyListeners();
  }

  final List<ExpenseModel> _expenseList = [];
  List<ExpenseModel> get expenseList => _expenseList;

  void addExpense(ExpenseModel expense, BuildContext  context){
    _expenseList.add(expense);
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("expense added successfully", style: GoogleFonts.aBeeZee(),)
      )
    );
    Navigator.pop(context);
  }

  void removeExpense(ExpenseModel expense, BuildContext context){
    _expenseList.remove(expense);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Expense deleted", style: GoogleFonts.aBeeZee(),),
            TextButton(
              onPressed: ()=>addExpense(expense, context), 
              child: Text("Undo", style: GoogleFonts.aBeeZee(),)
            )
          ],
        )
      )
    );
    notifyListeners();
  }
}