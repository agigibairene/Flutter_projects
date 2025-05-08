import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget{
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorscheme.onPrimary
            ),
            child: 
              ListTile(
                leading: Icon(Icons.fastfood, size: 50,),
                title: Text("Cooking up", style: TextStyle(fontSize: 22),),
              )
          ),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              leading: Icon(Icons.restaurant, size: 30, color: Colors.white,),
              title: Text("Meals",style: TextStyle(fontSize: 20),),
              onTap: ()=>Navigator.pushNamed(context, '/home'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              leading: Icon(Icons.settings, size: 30,),
              title: Text("Filters", style: TextStyle(fontSize: 20),),
              onTap: () => Navigator.pushNamed(context, '/filters'),
            ),
          )
        ],
      ),
    );
  }
}