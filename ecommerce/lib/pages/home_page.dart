// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/pages/cart.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/utils/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  final List pages = [Home(), Cart()];

  void navToPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[300],
      body: pages[_selectedIndex],
      bottomNavigationBar: MyBottomNav(
        onTabChange: (index) =>navToPage(index),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            DrawerHeader(child: Image.asset('images/adidas_logo.png', height: 200,color: Colors.white,)),

            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.home, size: 30, color: Colors.white,),
                title: Text("Home", style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.info, size: 30, color: Colors.white,),
                title: Text("About", style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.logout, size: 30, color: Colors.white,),
                title: Text("Logout", style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}