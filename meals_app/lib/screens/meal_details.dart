import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/providers/fav_meal.dart';

class MealDetails extends StatelessWidget{
  final Meal meal;
  const MealDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title, style: TextStyle(color: Colors.white),),
        actions: [
          Consumer<FavMealProvider>(
            builder: (context, mealProvider, child){
            final isFav = mealProvider.isFavMeal(meal);
              return IconButton(
                onPressed: ()=>mealProvider.toggleMeals(meal), 
                icon: isFav ? Icon(Icons.star) : Icon(Icons.star_border_outlined),
              );
            }
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          clipBehavior: Clip.hardEdge,
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            SizedBox(height: 40,),
            Text("Ingredients", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            ...meal.ingredients.map((food){
              return Text(food, style: TextStyle(color: const Color.fromARGB(255, 221, 221, 221), fontSize: 18), textAlign: TextAlign.center);

            }),
            SizedBox(height: 40,),
            Text("Steps", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center ),
            SizedBox(height: 20,),
            ...meal.steps.map((step){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(step, style: TextStyle(color: const Color.fromARGB(255, 221, 221, 221), fontSize: 18), textAlign: TextAlign.center),
              );

            })
          ],
        ),
      ),
    );
  }
}