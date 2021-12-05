import 'package:example/pages/flutter_chart.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/pages/job_detials.dart';
import 'package:example/pages/photo.dart';
import 'package:example/pages/signup.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/animation.dart';
import 'pages/signup_form_validation.dart';
void main(String) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StocksPage(),
    );
  }
}