import 'package:flutter/material.dart';
import 'package:meals_app/providers/fav_meal.dart';
import 'package:meals_app/widgets/meal_item_stack.dart';
import 'package:provider/provider.dart';

class  Favorites extends StatelessWidget{
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Oops.....!!!", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, fontSize: 28),),
            const SizedBox(height: 8),
            Text("Select A favorite meal", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18),)
          ],
      ),
    );

    return Consumer<FavMealProvider>(
      builder: (context, favProvider, child){
        return favProvider.favMeals.isEmpty ? content : 
        ListView.builder(
          itemCount: favProvider.favMeals.length,
          itemBuilder: (context, index){
            return MealItemStack(meal: favProvider.favMeals[index]);
          }
        );
          
      }
    );
  }
}