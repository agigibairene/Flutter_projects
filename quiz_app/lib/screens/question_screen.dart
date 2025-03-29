import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/question_provider.dart';


class QuestionScreen extends StatelessWidget{
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 9, 194),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Consumer<QuestionProvider>(builder: (context, questionProvider, child){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(questionProvider.currentQuestion.question, 
                style: GoogleFonts.openSans(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              ...questionProvider.currentQuestion.answers.map((answer){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                      questionProvider.answeredQuestions(answer);
                      questionProvider.getCurrentQuestion();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text(answer, style: GoogleFonts.openSans(color: Colors.white, fontSize: 22), textAlign: TextAlign.center,),
                    ),
                  ),
                );
              })
            ],
          );
        })
      ),
    );    
  }
}