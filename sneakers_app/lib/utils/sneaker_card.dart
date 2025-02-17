import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "./shoe.dart";

class Sneakers extends StatelessWidget{
  Shoe shoes; 
  Sneakers({super.key, required this.shoes});

  @override
  Widget build(BuildContext context){
    return Container(
        width: 280,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Image.asset(shoes.imagePath, height: 300,),
            Text(shoes.description, style: GoogleFonts.neucha(color: Colors.grey[700], fontSize: 19),),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                  child: Column(
                    children: [
                      Text(shoes.name, style: GoogleFonts.neucha(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                      Text("\$${shoes.amount.toString()}", style: GoogleFonts.neucha(color: Colors.black, fontSize: 20))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomRight: Radius.circular(8))
                  ),
                  child: Icon(Icons.add, color: Colors.white,),
                )
              ],
            )
          ],
        ),
      );
  }
}