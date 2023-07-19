import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dice/services/location.dart';
import 'package:dice/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'e45e7eeafff52fd932afcd432a857f2d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

// class _LoadingScreenState extends State<LoadingScreen> {
//
//   // void getLocation() async {
//   //
//   //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   //   print(position);
//   //
//   // }
//
//   void getLocation() async {
//     // Request permission to access the device's location
//     PermissionStatus permissionStatus = await Permission.location.request();
//
//     if (permissionStatus.isGranted) {
//       // Permission granted, get the current location
//       Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       print(position);
//     } else {
//       // Permission denied, handle accordingly
//       print('Permission denied');
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             getLocation();
//             // Get the current location
//           },
//           child: Text('Get Location'),
//         ),
//       ),
//     );
//   }
// }
//




// here i want when enter to this page it want print the location without clicking get location. so there is no need of get location button.so is there any way?
// yes we can below are the steps

class _LoadingScreenState extends State<LoadingScreen> {
  // late double latitude;
  // late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    Uri apiUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    NetworkHelper networkHelper = NetworkHelper(apiUrl);
    var weatherData = await networkHelper.getData();

    if (weatherData != null) {
      // Weather data is available, proceed with displaying the location screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return LocationScreen(locationWeather: weatherData);
        }),
      );

      // Do something with weatherData
      // print(condition);
      // print(cityName);
      // print(temperature);
    } else {
      // Weather data is null, handle the error (e.g., show an error message)
      print('Weather data is null');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.black,
            size: 100.0,
          ),

      ),
    );
  }
}