import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_card.dart';
import '/main.dart'; 

final List<Map<String, dynamic>> mealContainer = [
  {
    "title": "Ghanaian delicacies",
    "routeName": "/filters",
    "colors": theme.colorScheme.primary,
  },
  {
    "title": "Rwandan Dishes",
    "routeName": "/filters",
    "colors": theme.colorScheme.secondary,
  },
  {
    "title": "Nigerian Dishes",
    "routeName": "/filters",
    "colors": theme.colorScheme.tertiary,
  },
  {
    "title": "Italian",
    "routeName": "/filters",
    "colors": theme.colorScheme.error,
  },
  {
    "title": "Chinese",
    "routeName": "/filters",
    "colors": Colors.blueAccent,
  },
  {
    "title": "Hamburgers",
    "routeName": "/filters",
    "colors": theme.colorScheme.onTertiary,
  },
  {
    "title": "Breakfast",
    "routeName": "/filters",
    "colors": theme.colorScheme.onPrimary,
  },
  {
    "title": "French",
    "routeName": "/filters",
    "colors": theme.colorScheme.onSecondary,
  },
  {
    "title": "Exotic",
    "routeName": "/filters",
    "colors": theme.colorScheme.onTertiary,
  },
  {
    "title": "Quick & Easy",
    "routeName": "/filters",
    "colors": theme.colorScheme.onError,
  },
];


class Categories extends StatelessWidget{
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 40,
          crossAxisSpacing: 30
        ), 
        itemCount: mealContainer.length,
        itemBuilder: (context, index){
          return MealCard(
            cardColor: mealContainer[index]["colors"], 
            title: mealContainer[index]["title"], 
            routeName: mealContainer[index]["routeName"], 
          );
        }
      ),
    );    
  }
}