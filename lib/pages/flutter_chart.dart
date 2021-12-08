import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({ Key? key }) : super(key: key);

  @override
  _StocksPageState createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {

  // crate list of spots for the graph by monthly, yearly of Google Stocks
  List<FlSpot> _daylySpots = [
    FlSpot(0, 500.0),
    FlSpot(1, 30.0),
    FlSpot(2, 100.0),
    FlSpot(3, 100.0),
    FlSpot(4, 100.0),
    FlSpot(5, 60.0),
    FlSpot(6, 40.0),
    FlSpot(7, 80.0),
    FlSpot(8, 60.0),
    FlSpot(9, 70.0),
    FlSpot(10, 50.0),
    FlSpot(11, 150.0),
    FlSpot(12, 70.0),
    FlSpot(13, 80.0),
    FlSpot(14, 60.0),
    FlSpot(15, 70.0),
    FlSpot(16, 60.0),
    FlSpot(17, 80.0),
    FlSpot(18, 110.0),
    FlSpot(19, 130.0),
    FlSpot(20, 100.0),
    FlSpot(21, 130.0),
    FlSpot(22, 160.0),
    FlSpot(23, 190.0),
    FlSpot(24, 150.0),
    FlSpot(25, 170.0),
    FlSpot(26, 180.0),
    FlSpot(27, 140.0),
    FlSpot(28, 150.0),
    FlSpot(29, 150.0),
    FlSpot(30, 130.0)
  ];

  List<FlSpot> _monthlySpots = [
    FlSpot(0, 300.0),
    FlSpot(1, 200.0),
    FlSpot(2, 100.0),
    FlSpot(3, 200.0),
    FlSpot(4, 50.0),
    FlSpot(5, 250.0),
    FlSpot(6, 190.0),
    FlSpot(7, 100.0),
    FlSpot(8, 170.0),
    FlSpot(9, 100.0),
    FlSpot(10, 150.0),
    FlSpot(11, 100.0),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 140,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 80, top: 30),
              child: Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.only(top:10),
              child: Text(
              'Aug 04 - Aug 10',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.only(top:10),
              child: Text(
              'Vs. Jul 28 - jul 03',
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 18,
              ),
            ),
            )
          ],
        ),
        actions: <Widget>[
         Container(
           height: 50,
           width: 50,
           margin: EdgeInsets.only(right: 12),
           child:  IconButton(
            icon: Icon(Icons.settings, color: Colors.blueGrey,),
            onPressed: () {},
          ),
         )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(right: 150),
              child:  FadeInUp(
              duration: Duration(milliseconds: 1000),
              from: 30,
              child: Text(
                '\$ 4,777.12',
                style:TextStyle(
                    color: Colors.blueGrey.shade100,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(right: 200 ),
              child:  FadeInUp(
              duration: Duration(milliseconds: 1000),
              from: 30,
              child: Text(
                '+1.5%',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),
            SizedBox(height: 100),
            FadeInUp(
              duration: Duration(milliseconds: 1000),
              from: 60,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: LineChart(
                  mainData(),
                  swapAnimationCurve: Curves.easeInOutCubic,
                  swapAnimationDuration: Duration(milliseconds: 1000),
                )
              ),
            ),
            // AnimatedContainer(
            //   duration: Duration(milliseconds: 500),
            //   height: MediaQuery.of(context).size.height * 0.3,
            //   padding: EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             _currentIndex = 0;
            //           });
            //         },
            //         child: Container(
            //           padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: _currentIndex == 0 ? Color(0xff161b22) : Color(0xff161b22).withOpacity(0.0),
            //           ),
            //           child: Text("Mon", style: TextStyle(color: _currentIndex == 0 ? Colors.blueGrey.shade200 : Colors.blueGrey, fontSize: 20),),
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             _currentIndex = 1;
            //           });
            //         },
            //         child: AnimatedContainer(
            //           duration: Duration(milliseconds: 500),
            //           padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: _currentIndex == 1 ? Color(0xff161b22) : Color(0xff161b22).withOpacity(0.0),
            //           ),
            //           child: Text("Tue", style: TextStyle(color: _currentIndex == 1 ? Colors.blueGrey.shade200 : Colors.blueGrey, fontSize: 20),),
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             _currentIndex = 2;
            //           });
            //         },
            //         child: AnimatedContainer(
            //           duration: Duration(milliseconds: 500),
            //           padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: _currentIndex == 2 ? Color(0xff161b22) : Color(0xff161b22).withOpacity(0.0),
            //           ),
            //           child: Text("Wed", style: TextStyle(color: _currentIndex == 2 ? Colors.blueGrey.shade200 : Colors.blueGrey, fontSize: 20),),
            //         ),
                    
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             _currentIndex = 3;
            //           });
            //         },
            //         child: AnimatedContainer(
            //           duration: Duration(milliseconds: 500),
            //           padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: _currentIndex == 3 ? Color(0xff161b22) : Color(0xff161b22).withOpacity(0.0),
            //           ),
            //           child: Text("Thu", style: TextStyle(color: _currentIndex == 3 ? Colors.blueGrey.shade200 : Colors.blueGrey, fontSize: 20),),
            //         ),
                    
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             _currentIndex = 4;
            //           });
            //         },
            //         child: AnimatedContainer(
            //           duration: Duration(milliseconds: 500),
            //           padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: _currentIndex == 4 ? Color(0xff161b22) : Color(0xff161b22).withOpacity(0.0),
            //           ),
            //           child: Text("Wed", style: TextStyle(color: _currentIndex == 4 ? Colors.blueGrey.shade200 : Colors.blueGrey, fontSize: 20),),
            //         ),
                    
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             _currentIndex = 5;
            //           });
            //         },
            //         child: AnimatedContainer(
            //           duration: Duration(milliseconds: 500),
            //           padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: _currentIndex == 5 ? Color(0xff161b22) : Color(0xff161b22).withOpacity(0.0),
            //           ),
            //           child: Text("Fri", style: TextStyle(color: _currentIndex == 5 ? Colors.blueGrey.shade200 : Colors.blueGrey, fontSize: 20),),
            //         ),
                    
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             _currentIndex = 6;
            //           });
            //         },
            //         child: AnimatedContainer(
            //           duration: Duration(milliseconds: 500),
            //           padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: _currentIndex == 6 ? Color(0xff161b22) : Color(0xff161b22).withOpacity(0.0),
            //           ),
            //           child: Text("Sat", style: TextStyle(color: _currentIndex == 6 ? Colors.blueGrey.shade200 : Colors.blueGrey, fontSize: 20),),
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             _currentIndex = 7;
            //           });
            //         },
            //         child: AnimatedContainer(
            //           duration: Duration(milliseconds: 500),
            //           padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: _currentIndex == 7 ? Color(0xff161b22) : Color(0xff161b22).withOpacity(0.0),
            //           ),
            //           child: Text("Sun", style: TextStyle(color: _currentIndex == 7 ? Colors.blueGrey.shade200 : Colors.blueGrey, fontSize: 20),),
            //         ),
                    
            //       ),
            //     ],
            //   )
            // ),
            SizedBox(height: 50,)
          ]
        ),
      )
    );
  }

  // Charts Data
  List<Color> gradientColors = [
    const Color(0xff02B375),
    const Color(0xff02B375),
  ];

  LineChartData mainData() {
    return LineChartData(
      
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        horizontalInterval: 1.5,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),

        bottomTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 8
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'JAN';
              case 1:
                return 'FEB';
              case 2:
                return 'MAR';
              case 3:
                return 'APR';
              case 4:
                return 'MAY';
              case 5:
                return 'JUN';
              case 6:
                return 'JUL';
              case 7:
                return 'AUG';
              case 8:
                return 'SEP';
              case 9:
                return 'OCT';
              case 10:
                return 'NOV';
              case 11:
                return 'DEC';
            }
            return '';
          },
          margin: 20,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 100:
                return '30k';
              case 200:
                return '50k';
              case 300:
                return '60K';  
            }
            return '';
          },
        ),
      ),
      minX: 0,
      maxX: _monthlySpots.length-1.toDouble(),
      minY: 0,
      maxY: 300,
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                    radius: 8,
                    color: [
                      Colors.black,
                      Colors.black,
                    ][index],
                    strokeWidth: 2,
                    strokeColor: Colors.black,
                  ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          tooltipBgColor: Color(0xffF3FCF9).withOpacity(0.8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '\$${touchedSpot.y.round()}.00',
                const TextStyle(color: Colors.black, fontSize: 12.0),
                
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _monthlySpots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: Offset(0, 0),
            gradientTo: Offset(0, 1),
            colors: [
              Color(0xffF0FCFA),
              Color(0xffF0FCFA)
            ]
          ),
        )
      ],
    );
  }
}