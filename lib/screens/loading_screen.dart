import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


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

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    // Request permission to access the device's location
    PermissionStatus permissionStatus = await Permission.location.request();

    if (permissionStatus.isGranted) {
      // Permission granted, get the current location
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
    } else {
      // Permission denied, handle accordingly
      print('Permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Getting Location...'),
      ),
    );
  }
}

