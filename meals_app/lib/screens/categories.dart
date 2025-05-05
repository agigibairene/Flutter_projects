import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_card.dart';
import 'package:meals_app/models/dummy_data.dart';


class Categories extends StatelessWidget{
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20
        ), 
        itemCount: mealContainer.length,
        itemBuilder: (context, index){
          return MealCard(
            cardColor: mealContainer[index].color, 
            title: mealContainer[index].title, 
            categoryName: mealContainer[index],
          );
        }
      ),
    );    
  }
}