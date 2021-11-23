import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xffF6F6F6),
            elevation: 0,
            forceElevated: true,
            floating: true,
            pinned: true,
            leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back), color: Colors.black,),
            expandedHeight: 50,
            
          ),
         SliverList(
              delegate: SliverChildListDelegate(
                [
                 Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 0.0, right: 35.0, top: 12),    
                                    child:Text('Jobs.af', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF312651) ),),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
                                    child:  Text('30 job Opportunity'),
                                  )
                                ],
                              )
                            ], 
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
                            height: 50,
                            width: 50,
                             decoration: BoxDecoration(
                               color:  Color(0xFFF97B5B),
                                border: Border.all(
                                color: Color(0xFFF97B5B),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                            child:IconButton(onPressed: (){},icon: Icon(Icons.filter_alt_outlined ), color: Colors.white,),
                          )
                        ],
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                              height: 60,
                              width: 120,
                              decoration: BoxDecoration(
                              color:  Color(0xff312651),
                                border: Border.all(
                              
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(2.0),
                                  margin: const EdgeInsets.only(left: 13.0,  top: 19),
                                  child: Text('Most Relevant', style: TextStyle(color: Colors.white),),
                                )
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: .0, right: 20.0, top: 20),
                              height: 60,
                              width: 120,
                              decoration: BoxDecoration(
                              color: Color(0xffE5E5E5),
                                border: Border.all(
                                  color: Colors.white
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(2.0),
                                  margin: const EdgeInsets.only(left: 13.0,  top: 19),
                                  child: Text('Most Relevant', style: TextStyle(color: Colors.black),),
                                )
                            ),
                            
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
        ],
      )
    );
  }
}