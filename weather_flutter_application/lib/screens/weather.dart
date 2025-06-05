import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_flutter_application/models/weather_model.dart';
import 'package:weather_flutter_application/models/weather_service.dart';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget{
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final weatherData = WeatherService();
  WeatherModel? weather;
  
  @override
  void initState(){
    loadWeather();
    super.initState();
  }

  void loadWeather() async{
    try{
      final weatherD = await weatherData.fetchWeatherData();
      setState(() {
        weather = weatherD;
      });
    }
    catch(e){
      throw Exception('Failed to fetch data');
    }
  }


  String convertToCelsius(double kelvin){
    double calculatedVal = kelvin - 273.15;
    return calculatedVal.toStringAsFixed(1);
  }

  String convertDate(int timestamps){
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamps*1000);
    String formattedDate = DateFormat('EEEE d - hh:mm a').format(date);
    return formattedDate;
  }

  String convertTimeOnly(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Text("Weather Application"),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness:  Brightness.dark
        ),
      ),
       body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2*kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                    color: Colors.orange
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent
                  ),
                ),
              ),
              weather == null ? CircularProgressIndicator() : SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('📍 Accra-Ghana', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                    const SizedBox(height: 8,),
                    const Text("Good morning", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),

                    Image.asset('assets/1.png'),
                    Center(
                      child: Text('${convertToCelsius(weather!.temperature)} °C', style: TextStyle(color: Colors.white, fontSize: 55 ,fontWeight: FontWeight.w600),),
                    ),
                    Center(
                      child: Text(weather!.description.toUpperCase(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),),
                    ),
                    Center(child: Text(convertDate(weather!.currentDate), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),)),
                    SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/11.png", scale: 8,),
                            const SizedBox(height: 8,),
                            Column(
                              children: [
                                Text("Sunrise", style: TextStyle(color: Colors.grey, fontSize: 18),),
                                Text(convertTimeOnly(weather!.sunrise), style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),)
                              ],
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Image.asset("assets/12.png", scale: 8,),
                            const SizedBox(height: 8,),
                            Column(
                              children: [
                                Text("Sunset", style: TextStyle(color: Colors.grey, fontSize: 18),),
                                Text(convertTimeOnly(weather!.sunset), style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/13.png", scale: 8,),
                            const SizedBox(height: 8,),
                            Column(
                              children: [
                                Text("Temp Max", style: TextStyle(color: Colors.grey, fontSize: 18),),
                                Text("${convertToCelsius(weather!.maxTemp)}°C", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),)
                              ],
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Image.asset("assets/13.png", scale: 8,),
                            const SizedBox(height: 8,),
                            Column(
                              children: [
                                Text("Temp Min", style: TextStyle(color: Colors.grey, fontSize: 18),),
                                Text("${convertToCelsius(weather!.minTemp)}°C", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),

                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );    
  }
}