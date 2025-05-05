import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemStack extends StatelessWidget{
  final Meal meal;
  const MealItemStack({super.key, required this.meal});


  void navigateToMealsDetails(BuildContext context){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context)=>MealDetails(meal: meal)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: ()=>navigateToMealsDetails(context),
        child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage), 
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Text(
                      meal.title, 
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _rowListTile(Icons.schedule, '${meal.duration.toString()} min'),
                        SizedBox(width: 8,),
                        _rowListTile(Icons.shopping_bag, meal.complexity.name),
                        SizedBox(width: 8,),
                        _rowListTile(Icons.attach_money, meal.affordability.name)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],),
      )
    );   
  }
}


Widget _rowListTile(IconData icon, String name){
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon),
      SizedBox(width: 4,),
      Text(name, style:  TextStyle(color: Colors.white, fontSize: 19),),
    ],
  );
}