import 'package:flutter/material.dart';
import 'package:multi_selector_app/widgets/choice_chip.dart';

class Study extends StatefulWidget{
  const Study({super.key});

  @override
  State<Study> createState() => _StudyState();
}


class _StudyState extends State<Study>{

  bool _isSelected = false;

  Map<String, bool> workoutSelection = {
    "Cardio": false,
    "Strength": false,
    "Power": false,
    "Core": false,
    "Grip": false,
    "Interval": false,
    "Endurance": false,
    "Fat Loss": false,
    "Performance": false,
    "Competitive": false,
    "Nutrition": false,
  };

  Map<String, String> iconsMap = {
    "Cardio": "heart_icon.png",
    "Strength": "dumbbell_icon.png",
    "Power": "barbell_plates_icon.png",
    "Core": "kettlebell_icon.png",
    "Grip": "spring_hand_machine_icon.png",
    "Interval": "stopwatch_icon.png",
    "Endurance": "treadmill_icon.png",
    "Fat Loss": "weighing_machine_icon.png",
    "Performance": "medal_icon.png",
    "Competitive": "calendar_icon.png",
    "Nutrition": "protein_shaker_icon.png",
  };

  void choiceSelected(){
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(child: Text("Multi study Selector", style: TextStyle(fontSize: 25),)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Choose two or more to continue"),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Wrap(
                  // spacing: ,
                  runSpacing: 4,
                  alignment: WrapAlignment.center,
                  children: [
                    ...iconsMap.entries.map((entry){
                      final bool isSelected = workoutSelection[entry.key] ?? false;
                      return ChoiceChipWidget(
                        icon: entry.value, 
                        isSelected: isSelected, 
                        text: entry.key, 
                        onTap: (){
                          setState(() {
                            workoutSelection[entry.key] = !isSelected; 
                          });
                        }
                      );
                    })
                  ],
                ),
              ),
            ),
            Spacer()
          ],
        ),
      )
    );
  }
}