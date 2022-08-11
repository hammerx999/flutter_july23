
import 'package:flutter/material.dart';
import 'package:flutterjuly23/pages/detail.dart';
import 'package:flutterjuly23/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Computer's Today ",
      theme: ThemeData(
        
        primarySwatch: Colors.blueGrey,
      ),initialRoute: '/',
     routes: {
       '/' : (context) => HomePage(),
       '/detail' :(context) =>  DetailPage()
     }
      
    );
  }
}

