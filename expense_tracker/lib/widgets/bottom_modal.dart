import 'package:expense_tracker/providers/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BottomModal extends StatefulWidget{
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal>{
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String selectedDate = "";
  List<Category> categories = Category.values;
  Category selectedCategory = Category.miscellaneous;

  void selectADate() async{
    var currentDate = DateTime.now();
    var firstDate = DateTime(currentDate.year-1, currentDate.month, currentDate.day);
    var lastDate = DateTime(currentDate.year, currentDate.month, currentDate.day);
    var choosenDate = await showDatePicker(
      context: context, 
      firstDate: firstDate, 
      lastDate: lastDate
    );
    if (choosenDate == null) return;
    setState(() {
      selectedDate = DateFormat.yMd().format(choosenDate);
    });
  }

  ExpenseModel? validatingValues(){
    String expense = _expenseController.text.trim();
    var amount = _amountController.text.trim();
    if (expense.isEmpty || amount.isEmpty || selectedDate.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter valid date, expense and amount"))
      );
      return null;
    }
    return ExpenseModel(
      expense: expense, 
      amount: double.tryParse(amount) ?? 0.00, 
      category: selectedCategory, 
      dateSelected: DateFormat.yMd().parse(selectedDate)
    );
  }


  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 50,),
      child: Consumer<ExpenseProvider>(
        builder: (context, expenseProvider, child) {
          return Column(
            children: [
              TextField(
                controller: _expenseController,
                decoration: InputDecoration(
                  label: Text("Expense")
                ),
              ),
              
              SizedBox(height: 30,),
          
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        label: Text("Amount"),
                        prefixText: "\$"
                      ),
                    ),
                  ),
              
                  Row(
                    children: [
                      Text(selectedDate.isEmpty ? "No date selected" : selectedDate , style: GoogleFonts.aBeeZee(),),
                      IconButton(
                        onPressed: selectADate, 
                        icon: Icon(Icons.calendar_month, size: 30,)
                      )
                    ],
                  )
                ],
              ),
          
              SizedBox(height: 30,),
          
              Row(
                children: [
                  DropdownButton<Category>(
                    items: categories.map((item){
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item.name.toUpperCase(), style: GoogleFonts.aBeeZee(fontSize: 18),),
                        );
                    }).toList(), 
                    value: selectedCategory,
                    onChanged: (Category? value){
                      setState(() {
                        selectedCategory = value!;
                      });
                    }
                  ),
                  SizedBox(width: 30,),
                  Row(
                    children: [
                      TextButton(
                        onPressed: ()=>Navigator.pop(context), 
                        child: Text("Cancel".toUpperCase(), style: GoogleFonts.aBeeZee(),)
                      ),
                      ElevatedButton(
                        onPressed: (){
                          ExpenseModel? newExpense = validatingValues();
                          if (newExpense != null){
                            return expenseProvider.addExpense(newExpense, context);
                          }
                        }, 
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              )
                            ),
                            child: Text("Save".toUpperCase(), style: GoogleFonts.aBeeZee(color: Colors.white),)
                      )
                    ],
                  )
                ],
              )
            ],
          );
        }
      ),
    );
  }
}