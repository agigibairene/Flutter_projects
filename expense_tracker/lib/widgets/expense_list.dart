import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

var format = DateFormat.yMd();

Map<Category, IconData> categoryIcons = {
  Category.academics: Icons.book,
  Category.food: Icons.food_bank,
  Category.miscellaneous: Icons.extension,
  Category.utilities: Icons.wifi
};

class ExpenseListCard extends StatelessWidget{
  String title;
  double amount;
  DateTime date;
  Category category;
  String uniqueKey;
  void Function(DismissDirection)? onDismissed;

  ExpenseListCard({
    super.key,
    required this.title, 
    required this.amount, 
    required this.category, 
    required this.date,
    required this.uniqueKey,
    required this.onDismissed
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(uniqueKey),
      onDismissed: (direction){
        onDismissed;
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent[100],
          borderRadius: BorderRadius.circular(8)
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text(title, style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 18),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${amount.toStringAsFixed(2)}", style: GoogleFonts.aBeeZee(fontSize: 18),),
                Row(
                  children: [
                    Icon(categoryIcons[category]),
                    SizedBox(width: 10,),
                    Text(format.format(date), style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 18),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}