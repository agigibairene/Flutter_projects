import "package:flutter/material.dart";
import "package:sneakers_app/pages/cart.dart";
import "package:sneakers_app/pages/first_page.dart";
import "package:sneakers_app/pages/homepage.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // home: FirstPage(),
      initialRoute: "/first",
      debugShowCheckedModeBanner: false,
      
      routes: {
        "/first": (context) => FirstPage(),
        "/home": (context) => HomePage(),
        "/cart": (context) => Cart()
      },
    );
  }
}