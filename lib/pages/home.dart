import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            forceElevated: true,
            floating: true,
            pinned: true,
            flexibleSpace:  FlexibleSpaceBar(
              title: Container(
                  child: Row(
                    children: [
                     Icon(Icons.arrow_back,),

                    ],
                ),
              ),
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
                  height: 80,
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
