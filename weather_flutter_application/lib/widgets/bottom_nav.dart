import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget{
  int selectedIndex;
  void Function(int)? onTabChange;
  BottomNav({super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context){
    return GNav(
      backgroundColor: Theme.of(context).primaryColor,
      color: Colors.white,
      onTabChange: onTabChange,
      tabs: [
        GButton(icon: Icons.home),
        GButton(icon: Icons.search),
        GButton(icon: Icons.sunny),
        GButton(icon: Icons.settings)
      ],
      selectedIndex: selectedIndex,
    );
  }
}