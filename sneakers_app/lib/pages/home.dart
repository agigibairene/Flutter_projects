// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneakers_app/utils/shoe.dart';
import '../utils/sneaker_card.dart';

class Home extends StatefulWidget{
  TextEditingController controller;

  Home({super.key, required this.controller,});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Shoe shoe =  Shoe(imagePath: "/imaage/cool.png", description: "Grey Nike Sneakers", amount: 100, name: "Nike, just do it!");
  // print(shoe);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(controller: widget.controller, 
                    decoration: InputDecoration(
                      hintText: "Search", 
                      hintStyle: GoogleFonts.neucha(color: Colors.grey[500], fontSize: 18, fontWeight: FontWeight.bold),
                      border: InputBorder.none
                    ),
                  ),
                ),
                Icon(Icons.search, size: 30, color: Colors.grey[400])
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text("Everyone flies, some fly longer than others", style: GoogleFonts.neucha(color: Colors.grey[800], fontSize: 20)),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hot Picks 🔥🔥", style: GoogleFonts.neucha(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              Text("See all", style: GoogleFonts.neucha(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, int index){
                Shoe shoe = Shoe(imagePath: "images/cool.png", name: "Nike", description: "Grey Nike shoes", amount: 100);
                return Sneakers(shoes: shoe,);
              },
              scrollDirection: Axis.horizontal,
            )
          ),
        ],
      ),
    );
  }
}