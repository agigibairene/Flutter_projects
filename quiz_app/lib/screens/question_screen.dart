import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/models/question_provider.dart';

class QuestionScreen extends StatelessWidget{
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionProvider>(
      builder: (context, questProvider, child){
        List<QuestionModel> allQuestions =  questProvider.allQuestions;
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 58, 9, 194),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(allQuestions[questProvider.currentIndex].question, 
                  style: GoogleFonts.neucha(fontSize: 22, color: Colors.white),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20,),
            
                ...allQuestions[questProvider.currentIndex].answers.map((answer){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: questProvider.getCurrentQuestion,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text(answer, style: GoogleFonts.neucha(color: Colors.white, fontSize: 24), textAlign: TextAlign.center,)
                      ),
                    ),
                  );
                })
            ],
                    ),
          ),
    );    
      }
    );
  }
}