import 'package:flutter/material.dart';

Map<String, String> listedFilters = {
  "Gluten free" : "Only include gluten-free meals.",
  "Lactose-free": "Only include lactose-free meals.",
  "Vegetarian": "Only include vegetarian meals.",
  "Vegan": "Only include vegan meals."
};

class Filters extends StatefulWidget{
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters>{
  final Map<String, bool> _filterStates = {
    "Gluten free": false,
    "Lactose-free": false,
    "Vegetarian": false,
    "Vegan": false,
  };


  void toggleChange(String keys, bool value){
    setState(() {
      _filterStates[keys] = value;
    });
  }

  @override
  Widget build(BuildContext context){
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.pushNamed(context, '/home'), 
          icon: Icon(Icons.arrow_back)
        ),
        title: Text("Your filters", style: TextStyle(fontSize: 20),),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: listedFilters.entries.map((filter){
          return ListTile(
            title: Text(filter.key),
            subtitle: Text(filter.value),
            key: ValueKey(filter.key),
            trailing: Switch(
              value: _filterStates[filter.key] ?? false,
              activeColor: colorscheme.onPrimary,
              onChanged: (value )=>toggleChange(filter.key, value)
            ),
          );
        }).toList()
      ),
    );
  }
}