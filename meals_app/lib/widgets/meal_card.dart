import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_list.dart';
import 'package:meals_app/models/dummy_data.dart';

class MealCard extends StatelessWidget{
  Color cardColor;
  String title;
  Category categoryName;

  MealCard({super.key, required this.cardColor, required this.title, required this.categoryName});

  void selectedCategory(BuildContext context, Category category){
    final List<Meal> filteredList = dummyMeals.where((meal)=> meal.categories.contains(category.id)).toList();
    Navigator.push(
      context, 
      MaterialPageRoute(
      builder: (context)=>MealsList(title: title, mealList: filteredList)
      )
    );
  }

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: ()=> selectedCategory(context, categoryName),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 10,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              cardColor.withOpacity(0.55),
              cardColor.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }
}