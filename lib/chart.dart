// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
//
// void main() {
//   runApp(MaterialApp(home: PieChartSample()));
// }
//
// class PieChartSample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pie Chart Example', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.purple,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: PieChart(
//             PieChartData(
//               sectionsSpace: 2,
//               centerSpaceRadius: 50,
//               sections: [
//                 PieChartSectionData(
//                   value: 40,
//                   color: Colors.blue,
//                   title: '40%',
//                   radius: 60,
//                   titleStyle: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//                 PieChartSectionData(
//                   value: 30,
//                   color: Colors.red,
//                   title: '30%',
//                   radius: 60,
//                   titleStyle: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//                 PieChartSectionData(
//                   value: 15,
//                   color: Colors.green,
//                   title: '15%',
//                   radius: 60,
//                   titleStyle: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//                 PieChartSectionData(
//                   value: 15,
//                   color: Colors.orange,
//                   title: '15%',
//                   radius: 60,
//                   titleStyle: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
//
// void main() {
//   runApp(MaterialApp(home: PieChartSample()));
// }
//
// class PieChartSample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pie Chart Example', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.purple,
//       ),
//       body: Align(
//         alignment: Alignment.topLeft, // <-- This moves the card to the top left
//         child: Card(
//           elevation: 8,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           margin: EdgeInsets.all(16),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: SizedBox(
//               height: 200,
//               width: 200,
//               child: PieChart(
//                 PieChartData(
//                   sectionsSpace: 2,
//                   centerSpaceRadius: 30,
//                   sections: [
//                     PieChartSectionData(
//                       value: 40,
//                       color: Colors.blue,
//                       title: '40%',
//                       radius: 60,
//                       titleStyle: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                     PieChartSectionData(
//                       value: 30,
//                       color: Colors.red,
//                       title: '30%',
//                       radius: 60,
//                       titleStyle: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                     PieChartSectionData(
//                       value: 15,
//                       color: Colors.green,
//                       title: '15%',
//                       radius: 60,
//                       titleStyle: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                     PieChartSectionData(
//                       value: 15,
//                       color: Colors.orange,
//                       title: '15%',
//                       radius: 60,
//                       titleStyle: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MaterialApp(home: PieChartSample()));
}

class PieChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pie Chart and Bar Chart Example',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Pie Chart Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 20,
                      sections: [
                        PieChartSectionData(
                          value: 40,
                          color: Colors.blue,
                          title: '40%',
                          radius: 60,
                          titleStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        PieChartSectionData(
                          value: 30,
                          color: Colors.red,
                          title: '30%',
                          radius: 60,
                          titleStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        PieChartSectionData(
                          value: 15,
                          color: Colors.green,
                          title: '15%',
                          radius: 60,
                          titleStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        PieChartSectionData(
                          value: 15,
                          color: Colors.orange,
                          title: '15%',
                          radius: 60,
                          titleStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Bar Chart Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: BarChart(
                    BarChartData(
                      maxY: 50,
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(toY: 20, color: Colors.red),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(toY: 35, color: Colors.green),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(toY: 15, color: Colors.blue),
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(toY: 40, color: Colors.orange),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
