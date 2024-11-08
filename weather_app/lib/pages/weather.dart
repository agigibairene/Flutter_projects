// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, collection_methods_unrelated_type
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/components/additional.dart';
import 'package:weather_app/components/api.dart';
import 'package:weather_app/components/card.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/pages/shimmer.dart';

class Weather extends StatefulWidget{
  Weather({super.key});

  @override
  State<Weather> createState()=> _Weather();
}

class _Weather extends State<Weather>{
  double temp = 0;
  bool isLoading = false;



  Future<Map<String, dynamic>> getCurrentWeather() async{
    try{
    
      String cityName = "accra";
        final response = await http.get(
          Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKeys")
      );
      final data = jsonDecode(response.body);
      
      if (data["cod"] != "200"){
        throw "Error in fetching weatherforecast";
      }
      return data;
      }
    catch(e){
        throw e.toString();
    }
    
  }



  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: Text("Weather App", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
          future: getCurrentWeather(),
          builder:(context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return CardListItem(isLoading: isLoading);
            }
            else if (snapshot.hasError){
              return Text(snapshot.error.toString());
            }

            final data = snapshot.data!;
            final current = data["list"][0];

            final currentTemp = current["main"]["temp"];
            final currentWeatherState = current["weather"][0]["main"];
            final pressure = current["main"]["pressure"];
            final humidity = current["main"]["humidity"];
            final windSpeed = current["wind"]["speed"];

            return Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 8, sigmaY: 8
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Text("${currentTemp.toString()}K", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                                SizedBox(height: 16,),
                                Icon(currentWeatherState == "Clouds" || currentWeatherState == "Rain" ? Icons.cloud : Icons.sunny, size: 70,),
                                SizedBox(height: 16,),
                                Text(currentWeatherState, style: TextStyle(fontSize: 20),),
                          ],),
                        ),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 25,),
                Text("Hourly Weather Forecast", style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
    
                SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index){
                          final hourlyData = data["list"][index+1];
                          final time = DateTime.parse(hourlyData["dt_txt"].toString());
                          return CardDetails(
                              time: DateFormat("j").format(time),
                              temperature: hourlyData["main"]["temp"].toString(),
                              typeIcon: (hourlyData["weather"][0]["main"] == "Rain" || hourlyData["weather"][0]["main"] == "Clouds" 
                                ? Icons.cloud : Icons.sunny),
                            );
                        }
                      ),
              ),      
              
              SizedBox(height: 20,),
              Text("Additional Information", style: TextStyle( fontSize: 25),),
              SizedBox(height: 15,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Addition(
                      iconx: Icons.water_drop, 
                      name: "Humidity", 
                      value: humidity.toString()
                    ),
                    Addition(
                      iconx: Icons.air,
                      name: "Wind", 
                      value: windSpeed.toString()
                    ),
                    Addition(
                      iconx: Icons.thermostat, 
                      name: "Pressure", 
                      value: pressure.toString()
                    ),
                    
                  ],
                )
              ],
           
         ) 
         );
  }),
    );

  }
}