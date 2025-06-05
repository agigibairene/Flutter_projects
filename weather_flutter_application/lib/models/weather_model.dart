class WeatherModel {
  final double temperature;
  final double minTemp;
  final double maxTemp;
  final String cityName;
  final String description;
  final int currentDate;
  final int sunrise;
  final int sunset;


  WeatherModel({
    required this.cityName, 
    required this.maxTemp, 
    required this.minTemp, 
    required this.temperature,
    required this.description,
    required this.currentDate,
    required this.sunrise,
    required this.sunset
  });

  factory WeatherModel.fromJSON(Map<String, dynamic> json){
    return WeatherModel(
      cityName: json['name'], 
      maxTemp: (json['main']["temp_min"] - 32)*5/9, 
      minTemp: json['main']["temp_min"], 
      temperature: json['main']["temp"],
      description: json['weather'][0]['description'],
      currentDate: json['dt'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset']
    );
  }


  
}