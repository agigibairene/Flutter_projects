import 'package:expense_tracker/providers/expense_provider.dart';
import 'package:expense_tracker/widgets/bottom_modal.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class ExpenseScreen extends StatelessWidget{
  const ExpenseScreen({super.key});

  void displayBottomModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (context){
        return BottomModal();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, expenseProvider, child){
        return  Scaffold(
       appBar: AppBar(
        leading: IconButton(
          onPressed: expenseProvider.toggleTheme, 
          icon: ThemeData.dark() == true ? Icon(Icons.nightlight) : Icon(Icons.sunny)
        ),
        backgroundColor: expenseProvider.theme.colorScheme.primary,
        title: Text("Expense Tracker", style: GoogleFonts.aBeeZee(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: ()=>displayBottomModal(context), 
            icon: Icon(Icons.add, size: 30, color: Colors.white,)
          )
        ],
      ),
      backgroundColor: expenseProvider.theme.colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: expenseProvider.expenseList.isEmpty ? Center(
              child: Text("Add a single expense".toUpperCase(), style: GoogleFonts.aBeeZee(fontSize: 20), ),) : 
              Column(
                children: [
                  Text("Expense Chart".toUpperCase()),
                  ...expenseProvider.expenseList.map((expense){
                    return ExpenseListCard(
                      title: expense.expense, 
                      uniqueKey: expense.uniqueId,
                      amount: expense.amount, 
                      category: expense.category, 
                      date: expense.dateSelected,
                      onDismissed:(direction)=>expenseProvider.removeExpense(expense, context),
                    );
                  })
                ],
          )
       
      )
    );    
      }
    );
  }
}