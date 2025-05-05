import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_stack.dart';

class MealsList extends StatelessWidget{
  String title;
  List<Meal> mealList;
  MealsList({super.key, required this.title, required this.mealList});
 

  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: Column(
      children: [
        Text("Oops.....!!!", style: Theme.of(context).textTheme.bodyLarge,),
        Text("Select another category", style: TextStyle(color: Theme.of(context).colorScheme.primary),)
      ],
    ),);

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white),),
      ),
      body: mealList.isEmpty ? content : 
        ListView.builder(
          itemCount: mealList.length,
          itemBuilder: (context, index){
            return MealItemStack(meal: mealList[index]);
        }
        ),
    );    
  }
}