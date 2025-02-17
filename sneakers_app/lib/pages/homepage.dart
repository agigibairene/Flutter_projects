import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "../utils/bottom_nav.dart";
import "./cart.dart";
import './home.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late TextEditingController _controller;
  late List _pages;

  @override
  void initState() {
    _controller = TextEditingController();
    _pages = [Home(controller: _controller), Cart()];
    super.initState();
  }

  int _selectedIndex = 0;

  void onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onTabChange: onTabChange,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  DrawerHeader(child: Image.asset("images/logo.png", color: Colors.white, height: 40,)),
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.white,), 
                    title: Text("Home", style: GoogleFonts.neucha(color: Colors.white, fontSize: 20),),
                    onTap: (){
                      Navigator.pushNamed(context, "/home");
                    },
                  ),
                  ListTile(leading: Icon(Icons.info, color: Colors.white,), 
                    title: Text("About", style: GoogleFonts.neucha(color: Colors.white, fontSize: 20),),
                    onTap: (){
                      Navigator.pushNamed(context, "/cart");
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: ListTile(leading: Icon(Icons.logout, color: Colors.white,), 
                title: Text("Logout", style: GoogleFonts.neucha(color: Colors.white, fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}