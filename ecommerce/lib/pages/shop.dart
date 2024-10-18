// ignore_for_file: prefer_const_constructors
import 'package:ecommerce/utils/shoe.dart';
import 'package:ecommerce/utils/shoe_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shop extends StatelessWidget {
  Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search", style: GoogleFonts.openSans(),),
              Icon(Icons.search, color: Colors.grey[100],)
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text("Everyone flies, some fly longer than others", style: TextStyle(color: Colors.grey[600], fontSize: 18),),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hot Picks🔥🌹", style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 24),),
            Text("See all", style: GoogleFonts.openSans(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),)
          ],
        ),
        ),

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index){
              Shoe shoes = Shoe(
                imageAsset: 'images/cool.png',
                price: "100",
                description: "Cool Jordan sneakers",
                name: "Cool Jordan"
              );
              return ShoeTile(shoe: shoes);
            }
          )
        )

      ],
    );
  }
}