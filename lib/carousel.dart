import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithCustomIndicator extends StatefulWidget {
  @override
  _CarouselWithCustomIndicatorState createState() =>
      _CarouselWithCustomIndicatorState();
}

class _CarouselWithCustomIndicatorState
    extends State<CarouselWithCustomIndicator> {
  int _currentIndex = 0;
  final List<String> imageUrls = [
    'assets/Images/background.jpg',
    'assets/Images/background.jpg',
    'assets/Images/background.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carousel with Custom Dots',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items:
                imageUrls
                    .map(
                      (url) => Image.asset(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                    .toList(),
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                imageUrls.asMap().entries.map((entry) {
                  int index = entry.key;
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
