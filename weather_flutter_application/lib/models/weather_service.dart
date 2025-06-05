import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:weather_flutter_application/models/weather_model.dart';

class WeatherService{
  final String apiKey = "c8989bb624e9b9f4d9b12cdc58385f18";
  final String cityName = 'Kigali';


  Future<WeatherModel> fetchWeatherData() async{
    final String url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      return WeatherModel.fromJSON(json);
    }
    else{
      throw Exception('Failed to fetch weather data');
    }
  }
}