// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  int selectedIndex;
  void Function(int)? onTabChange;

  BottomNav({super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: GNav(
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
            textStyle: GoogleFonts.neucha(fontSize: 20, fontWeight: FontWeight.bold),

          ),
          GButton(
            icon: Icons.shopping_cart,
            text: "Cart",
            textStyle: GoogleFonts.neucha(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
        tabBackgroundColor: Colors.grey.shade100,
        activeColor: Colors.grey[700],
        color: Colors.grey[400],
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        iconSize: 38,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 15,
        gap: 5,
      
      ),
    );
  }
}