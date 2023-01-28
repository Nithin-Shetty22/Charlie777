import 'package:charlie777/screens/onboard.dart';
import 'package:charlie777/screens/spalshscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Charlie777',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpalshScreen(),
    );
  }
}
