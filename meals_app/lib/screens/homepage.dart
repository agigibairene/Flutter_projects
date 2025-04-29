import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/favorites.dart';
import 'package:meals_app/widgets/bottom_nav.dart';
import 'package:meals_app/widgets/side_drawer.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void changeSelectedIndex(int value){
    setState(() {
      selectedIndex = value;
    });
  }

  List pages = [Categories(), Favorites()];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu, color: Colors.white, size: 30,),
        title: Text(selectedIndex == 0 ? "Categories" : "Favorites", style: TextStyle(color: Colors.white),),
        backgroundColor: theme.onPrimary,
      ),
      bottomNavigationBar: BottomNav(onTabChange: changeSelectedIndex, selectedIndex: selectedIndex),
      drawer: SideDrawer(),
      body: selectedIndex == 0 ? Categories() : Favorites(),
    );
  }
}