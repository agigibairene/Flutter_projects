// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget{
  IntroPage({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/adidas_logo.png', height: 240,),

          Text("Adidas", style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 25),),

          SizedBox(height: 20,),

          Text(
            "Brand new sneakers and custom kicks made with premium quality and love", 
            style: GoogleFonts.openSans(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 40,),

         GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, '/homepage'),
          child:  Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6)
            ),
            width: double.infinity,
            child: Text(
              "Shop Now", 
              style: GoogleFonts.openSans(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
         )

        ],
        ),
      ),
    );  
  }
}