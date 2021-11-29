import 'package:example/pages/home_page.dart';
import 'package:example/pages/job_detials.dart';
import 'package:example/pages/photo.dart';
import 'package:example/pages/signup.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/animation.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Photo(),
    );
  }
}