import 'package:flutter/material.dart';
import 'package:meals_app/widgets/side_drawer.dart';
import 'package:provider/provider.dart';
import 'package:meals_app/providers/filters_provider.dart';

Map<String, String> listedFilters = {
  "Gluten free" : "Only include gluten-free meals.",
  "Lactose-free": "Only include lactose-free meals.",
  "Vegetarian": "Only include vegetarian meals.",
  "Vegan": "Only include vegan meals."
};

class Filters extends StatelessWidget{
  const Filters({super.key});

  @override
  Widget build(BuildContext context){
    final colorscheme = Theme.of(context).colorScheme;
    return Consumer<FiltersProvider>(
      builder: (context, filterProvider, child){
        return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result){
        if (didPop) return;
        Navigator.of(context).pop(filterProvider.filters);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your filters", style: TextStyle(fontSize: 20),),
        ),
        drawer: SideDrawer(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: listedFilters.entries.map((filter){
            return ListTile(
              title: Text(filter.key, style: TextStyle(fontSize: 22),),
              subtitle: Text(filter.value),
              key: ValueKey(filter.key),
              trailing: Switch(
                value: filterProvider.filters[filter.key] ?? false,
                activeColor: colorscheme.onPrimary,
                onChanged: (value )=>filterProvider.toggleFilters(filter.key, value)
              ),
            );
          }).toList()
        ),
      ),
    );
      }
    );
  }
}