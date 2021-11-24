import 'package:example/pages/home.dart';
import 'package:flutter/material.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({ Key? key }) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        leading: IconButton(onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
           );
        },icon: Icon(Icons.arrow_back), color: Colors.black,),
        actions: [IconButton(onPressed: (){},icon: Icon(Icons.home), color: Colors.black,),],
      ),
      
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20, width: 300,),
              Container(
                margin: EdgeInsets.only(left: 0,top: 20),
                padding: const EdgeInsets.all(0),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color:  Colors.grey,
                    border: Border.all(
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(18))
                 ),
                child: Image.asset(
                  "images/icons8-chrome.gif",
                  height: 50,
                  width: 50,
                  
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  children: [
                    Text('Lead Product Manager', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold) ,),
                    Container(
                      margin: EdgeInsets.only(left: 75,top: 8),
                      child: Row(
                        children: [
                          Text('Google/', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          Text('Tokyo, Japan'),
                        ],
                      ),
                    ) 
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(left: 12),
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: _currentIndex == 0 ? Colors.blue : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text('Description', style: TextStyle(
                          color: _currentIndex == 0 ? Colors.white : Colors.grey.shade600,
                          fontSize: 16
                        ),),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(left: 12,),
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: _currentIndex == 1 ? Colors.blue : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text('Company', style: TextStyle(
                          color: _currentIndex == 1 ? Colors.white : Colors.grey.shade600,
                          fontSize: 16
                        ),),
                      ),
                    )
                  ],
                ),
              ),
              _currentIndex == 0 ? Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)
                ) ,
                height: 300,
                width: 300,
               child: Column(children: [
                Container(
                   margin: EdgeInsets.only(left:0, right: 120, top: 40),
                   child: Text('Qualifications:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF312651)),),
                 ),
                
                Container(
                  margin: EdgeInsets.only(left: 25, top: 8), 
                  child: Text('-Bacholar degree or equivalint practical experince ', style: TextStyle(fontWeight: FontWeight.w300),)
                 ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 8), 
                  child: Text('-7 years of technical product management\n experince such as Creating strategic\n  product roadmaps and working with\n cross-functional teams ', style: TextStyle(fontWeight: FontWeight.w300),)
                 ),
                Container(
                  margin: EdgeInsets.only(left: 25, top: 8), 
                  child: Text('-Bacholar degree or equivalint practical experince ', style: TextStyle(fontWeight: FontWeight.w300),)
                 ),
                Container(
                  margin: EdgeInsets.only(left: 25, top: 8), 
                  child: Text('-Bacholar degree or equivalint practical experince ', style: TextStyle(fontWeight: FontWeight.w300),)
                 )
                ],
               ),
              ) : _currentIndex == 1 ? Container(
                child: Text('Ostad'),
              ) :Container(),
            SizedBox(height: 15,), 
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)
                ) ,
              child: Column(
                children: [
                 Container(
                  margin: EdgeInsets.only(left: 0, top: 20), 
                  child:  Text('Google LLC is an American multinational\n technology company that specializes\n in Internet-related services and products,\n which include online advertising technologies,\n a search engine, cloud computing,\n software, and hardware.',
                  style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                 )
                ],
              )  
            ),
            SizedBox(height: 20,),
            BottomAppBar(
              elevation: 0,
              child: Row(
              children: [
                Container(
                 padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xffFF7755)
                    )
                  ),
                  height: 80,
                  width: 80,
                  child:IconButton(icon: Icon(Icons.favorite),iconSize: 40, color: Color(0xffFF7755), onPressed: () {}),

                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 80,
                  width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffFF7755)  
                      ),
                  child: Container(
                    margin: EdgeInsets.only(left: 55, top: 27),  
                    child: Text('Apply for job', style: TextStyle(fontSize: 20, 
                    fontWeight: FontWeight.bold, color: Colors.white),),
                  ) 
                    )                
                  ], 
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}


