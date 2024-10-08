// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNav extends StatelessWidget {
  void Function(int)? onTabChange;

  MyBottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 120),
      child: GNav(
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.white,
        tabActiveBorder: Border.all(color: Colors.white,),
        tabBorderRadius: 10,
        color: Colors.grey,
        onTabChange: onTabChange,
        tabs: [

          GButton(
            icon: Icons.home,
            text: "Home",
          ),

          GButton(icon: Icons.shopping_cart, text: "Cart")
        ]
      ),
    ),
    );
  }
}