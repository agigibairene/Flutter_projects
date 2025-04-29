import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget{

  int selectedIndex = 0;

  void Function(int)? onTabChange;

  BottomNav({super.key, required this.onTabChange, required this.selectedIndex});

  @override
  Widget build(BuildContext context){
    final colorscheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: GNav(
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
        activeColor: Colors.grey[100],
        tabBorderRadius: 25,
        tabBackgroundColor: colorscheme.onSecondary,
        iconSize: 30,
        tabs: [
          GButton(
            icon: Icons.category,
            text: "Categories",
          ),
          GButton(
            icon: Icons.star,
            text: "Favorite",
          )
        ]
      ),
    );
  }
}