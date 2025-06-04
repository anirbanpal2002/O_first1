import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rangeslider extends StatefulWidget {
  const Rangeslider({super.key});

  @override
  State<Rangeslider> createState() => _RangesliderState();
}

class _RangesliderState extends State<Rangeslider> {
  int age = 18;
  RangeValues _currentRangeValues = const RangeValues(10, 100);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Range Slider", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _currentRangeValues.start.round().toString(),
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _currentRangeValues.end.round().toString(),
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RangeSlider(
              values: _currentRangeValues,
              max: 1000,
              divisions: 10,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            SizedBox(height: 20, width: 20),
            Container(
              width: 100,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        age.round().toString(),
                        style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Slider(
              value: age.toDouble(),
              min: 5,
              max: 100,
              divisions: 95, // Important to show the label
              label: age.toString(), // This shows the value above the thumb
              onChanged: (value) {
                setState(() {
                  age = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
