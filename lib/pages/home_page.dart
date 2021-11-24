import 'dart:ffi';

import 'package:example/pages/home.dart';
import 'package:example/pages/job_detials.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Image.asset('images/finder.jpg', fit:BoxFit.cover, height: 400, width: 350,),
              ),
              Transform.translate( offset: Offset(0, -60),
              child: Container(
                padding: EdgeInsets.all(20),
                height: 390,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.grey.shade200
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, right: 150 ),
                      child: Text('Find a perfect \n job match', style: TextStyle(fontSize: 25, color: Color(0xFF312651)),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, right: 15),
                      child: Text('Finding your dream job is now much\n easier and faster like never before', style: TextStyle(fontSize: 18,color: Color(0xFF312651) ),),
                    ),
                    SizedBox(height: 100,),
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xffFF7755),
                        borderRadius: BorderRadius.all(Radius.circular(25)),                      ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 60),
                        child:Text('Lets Get Started', style: TextStyle(fontSize: 20, color: Colors.white),),),
                        Container(
                        child:IconButton(onPressed: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => JobDetails()),
                            );
                          },icon: Icon(Icons.arrow_forward ), color: Colors.white,
                          iconSize: 30,),)
                      ],
                    ),
                    )
                  ],
                ),
              ),
              ),
              
            ],
          ),
        ),
      ),
      
    );
  }
}