import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/meal_item_stack.dart';
import 'package:provider/provider.dart';

class MealsList extends StatelessWidget{
  String title;
  List<Meal> mealList;
  MealsList({super.key, required this.title, required this.mealList});

  List<Meal> _filterMeals(List<Meal> meals, Map<String, bool> filters) {
    return meals.where((meal) {
      if (filters["Gluten free"]! && !meal.isGlutenFree) return false;
      if (filters["Lactose-free"]! && !meal.isLactoseFree) return false;
      if (filters["Vegetarian"]! && !meal.isVegetarian) return false;
      if (filters["Vegan"]! && !meal.isVegan) return false;
      return true;
    }).toList();
  }
 

  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: Column(
      children: [
        Text("Oops.....!!!", style: Theme.of(context).textTheme.bodyLarge,),
        Text("Select another category", style: TextStyle(color: Theme.of(context).colorScheme.primary),)
      ],
    ),);

    return Consumer<FiltersProvider>(
      builder: (context, filtersProvider,child){
        final filters = filtersProvider.filters;
        final filteredMeals = _filterMeals(mealList, filters);

        return Scaffold(
          appBar: AppBar(
            title: Text(title, style: TextStyle(color: Colors.white),),
          ),
          body: mealList.isEmpty ? content : 
            ListView.builder(
              itemCount: filteredMeals.length,
              itemBuilder: (context, index){
                return MealItemStack(meal: filteredMeals[index]);
            }
          ),
        );    
      }
    );
  }
}