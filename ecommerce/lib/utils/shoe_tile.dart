// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:ecommerce/utils/shoe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(left: 20),
      // padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:  Image.asset(shoe.imageAsset,),
          ),
          Text(shoe.description, style: GoogleFonts.openSans(color: Colors.grey[600]),),
          
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shoe.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 5,),
                  Text('\$' +shoe.price,style: GoogleFonts.openSans(color: Colors.grey[900], fontSize: 15, fontWeight: FontWeight.w600),),
                ],
              ),

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)
                  ),
                ),
                child: Icon(Icons.add, color: Colors.white,),
              )
            ],
          ),
          )
        ],
      ),
      )
    );
  }
}