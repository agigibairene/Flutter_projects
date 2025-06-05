import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherRiverpod extends StateNotifier<List>{
  WeatherRiverpod() : super([]);

}


final weatherProvider = StateNotifierProvider<WeatherRiverpod, List>((ref){
  return WeatherRiverpod();
});