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
            backgroundColor: Colors.white,
            elevation: 0,
            forceElevated: true,
            floating: true,
            pinned: true,
            flexibleSpace:  FlexibleSpaceBar(
              title:TextField (  
                      style: TextStyle( color: Colors.black,),  
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 0.0, top: 0.0),
                       focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(25.7),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      ),  
                      hintText: 'Search jobs',
                      hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ), 
                    ),  
                    ),
              background: Image.network('https://ouch-cdn2.icons8.com/swz6i1TfzNagcn_fUFBqatZ4Y56kSn4vCiFobg1g3IA/rs:fit:196:196/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNDE5/Lzg3YTNlOTE3LWNl/ZjAtNDg5OC04NDhi/LWE4ODk5ODMwMWZl/ZC5zdmc.png')
            ),
            expandedHeight: 280,
            
          ),
         SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(15),
                child: Container(
                  color: Colors.blue[100 * (index % 9 + 1)],
                  height: 200,
                  alignment: Alignment.center,
                  child: Text(
                    "Item $index",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              );
            },
            childCount: 1000, // 1000 list items
          ),
        ),
        ],
      
      )
    );
  }
}