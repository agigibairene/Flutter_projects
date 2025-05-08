import 'package:flutter/material.dart';

class FiltersProvider extends ChangeNotifier{
  
  Map<String, bool> _filters = {
    "Gluten free": false,
    "Lactose-free": false,
    "Vegetarian": false,
    "Vegan": false,
  };

  Map<String, bool> get filters => _filters;


  void setFilters(Map<String, bool> newFilters){
    _filters = newFilters;
    notifyListeners();
  }

  void toggleFilters(String key, bool value){
    _filters[key] = value;
    notifyListeners();
  }
}