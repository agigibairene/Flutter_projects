import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/question_provider.dart';

class ScoreScreen extends StatelessWidget{
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 9, 194),
      body: Consumer<QuestionProvider>(
        builder: (context, questionProvider, child){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
            Text("Your final Score is ${questionProvider.score.toString()}",
              style: GoogleFonts.openSans(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
             SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: questionProvider.answeredQuestionList.length,
                itemBuilder: (context, index) {
                  return Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: questionProvider.answeredQuestionList[index]["isAnswerCorrect"] == "true" ? Colors.blue : Colors.purpleAccent,
                        child: Text((index+1).toString(), style: GoogleFonts.openSans(color: Colors.white, fontSize: 18), )
                      ),
                      SizedBox(height: 20,),
                      Column(
                        spacing: 10,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(questionProvider.answeredQuestionList[index]["question"]!, softWrap: true, style: GoogleFonts.openSans(color: Colors.white, fontSize: 18), ),
                          Text("Correct Ans: ${questionProvider.answeredQuestionList[index]["correctAnswer"]!}", style: GoogleFonts.openSans(color: Colors.yellowAccent, fontSize: 18)),
                          Text("Your Ans: ${questionProvider.answeredQuestionList[index]["choosenAnswer"]!}", style: GoogleFonts.openSans(color: Colors.white, fontSize: 18)),
                          
                        ],
                      )
                    ],
                  );
                },
              )
            )
                    ],
                  ),
          );
      })
    );   
  }
}