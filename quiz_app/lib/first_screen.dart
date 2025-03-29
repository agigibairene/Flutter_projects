import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatelessWidget{
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 9, 194),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/quiz-logo.png", height: 300, color: Color.fromARGB(248, 243, 212, 212),),
          SizedBox(height: 100,),
          Text("Learn Flutter the fun way!", style: GoogleFonts.neucha(fontSize: 25, color: Colors.white), ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, "/question"),
            child: Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_forward, size: 25, color: Colors.white,),
                Text("Start quiz", style: GoogleFonts.neucha(color: Colors.white, fontSize: 20),)
              ],
            ),
          )
        ],
      ),
    );    
  }
}