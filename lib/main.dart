import 'package:flutter/material.dart';
import 'package:fyp_project/login_page.dart';
import 'package:fyp_project/mechanisms_list.dart';
import 'package:fyp_project/visualizer_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AR Products Tester App',
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home:LoginPage(), // LoginPage(), MechanismsList()
    );
  }
}