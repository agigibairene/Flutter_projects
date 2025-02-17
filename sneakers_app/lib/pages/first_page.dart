import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';


class FirstPage extends StatelessWidget{
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png", width: 400, color: Colors.black,),
            // SizedBox(height: 15,),
            Text("Adidas", style: GoogleFonts.neucha(fontWeight: FontWeight.bold, fontSize: 40),),
            SizedBox(height: 10,),
            Text(
              "Brand new sneakers and custom kicks made with premium quality and love", 
              style: GoogleFonts.neucha(fontSize: 20, color: Colors.grey[800]),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20,),

            GestureDetector(
              onTap: ()=>Navigator.pushNamed(context, "/home"),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text("Shop Now", style: GoogleFonts.neucha(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}