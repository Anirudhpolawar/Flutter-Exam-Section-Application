import 'package:examination/Screens/Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Examination Section',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: Login(),
    );
  }
}

