import 'package:flutter/material.dart';

class MealCard extends StatelessWidget{
  Color cardColor;
  String title;
  String routeName;
  MealCard({super.key, required this.cardColor, required this.title, required this.routeName});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 10,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}