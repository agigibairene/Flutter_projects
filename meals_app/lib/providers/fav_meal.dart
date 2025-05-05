import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class FavMealProvider extends ChangeNotifier{
  List<Meal> favMeals = [];


  bool isFavMeal(Meal meal){
    return favMeals.any((dish)=> dish.id == meal.id);
  }


  void toggleMeals(Meal meal){
    final isExisiting = favMeals.any((dish)=>dish.id == meal.id);

    if (isExisiting){
      favMeals.removeWhere((dish)=>dish.id == meal.id);
    }
    else{
      favMeals.add(meal);
    }
    notifyListeners();
  }
}