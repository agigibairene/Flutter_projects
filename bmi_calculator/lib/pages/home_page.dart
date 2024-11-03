// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'dart:math';

import 'package:bmi_calculator/components/toggle_btn.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  late List<bool> isSelected;
  TextEditingController heightTxt = TextEditingController();
  TextEditingController weightTxt = TextEditingController();
  String height = "";
  String weight = "";
  bool isMetric = true;
  bool isImperial = false;
  double results = 0; 


  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  void toggleToBtn(int index){
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
      isMetric = isSelected[0];
      isImperial = isSelected[1];
      
      heightTxt.clear();
      weightTxt.clear();
      results = 0;
    });
  }

  void calculate(){
    try{
      double weightInt = double.parse(weightTxt.text);
      double heightInt = double.parse(heightTxt.text);

      double bmi;
      if (isMetric){
        bmi = weightInt/pow(heightInt, 2);
      }
      else{
        bmi = (weightInt/heightInt) * 703;
      }
      setState(() {
        results = bmi;
      });
    }
    catch(err){
      print("Error:  + $err");
    }

  }


  @override
  Widget build (BuildContext context){
    height = "Please Enter your height in ${isMetric ? "meters": "foot"}";
    weight = "Please Enter your weight in ${isMetric ? "kg": "pounds"}";
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR", style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: ToggleBtn(
                  isSelected: isSelected, 
                  onPressed: toggleToBtn
                ),
              ),
        
              SizedBox(height: 40,),
        
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: heightTxt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: height,
                    border: OutlineInputBorder()
                  ),
                ),
              ),
        
              SizedBox(height: 40,),
        
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: weightTxt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: weight,
                    border: OutlineInputBorder()
                  ),
                ),
              ),
        
              SizedBox(height: 40,),
        
              ElevatedButton(
                onPressed: calculate, 
                child: Text("Calculate", style: TextStyle(fontSize: 20, color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
              ),
        
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('Results: ${results.toStringAsFixed(3)}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }
}