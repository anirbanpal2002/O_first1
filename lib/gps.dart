// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationPage extends StatefulWidget {
//   @override
//   _LocationPageState createState() => _LocationPageState();
// }
//
// class _LocationPageState extends State<LocationPage> {
//   String location = 'Press button to get location';
//
//   Future<void> getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       setState(() {
//         location = 'Location services are disabled...';
//       });
//       return;
//     }
//
//     // Request permission
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         setState(() {
//           location = 'Location permission denied.';
//         });
//         return;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       setState(() {
//         location = 'Location permissions are permanently denied...';
//       });
//       return;
//     }
//
//     // Get current location
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     setState(() {
//       location = 'Lat: ${position.latitude}, Long: ${position.longitude}';
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Geolocator Example")),
//       body: Center(child: Text(location)),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getLocation,
//         child: Icon(Icons.location_on),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GPSLocationPage extends StatefulWidget {
  @override
  _GPSLocationPageState createState() => _GPSLocationPageState();
}

class _GPSLocationPageState extends State<GPSLocationPage> {
  Position? _position;
  String _locationMessage = "Press the button to get location";

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = 'Location services are disabled.';
      });
      return;
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = 'Location permissions are denied';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = 'Location permissions are permanently denied.';
      });
      return;
    }

    // Get current location
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _position = position;
      _locationMessage =
          'Lat: ${position.latitude}, Long: ${position.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GPS Location'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 80, color: Colors.blue),
              SizedBox(height: 20),
              Text(
                _locationMessage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _getCurrentLocation,
                icon: Icon(Icons.my_location),
                label: Text("Get Current Location"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
