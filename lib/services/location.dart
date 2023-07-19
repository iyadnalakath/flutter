import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {

    PermissionStatus permissionStatus = await Permission.location.request();

    if (permissionStatus.isGranted) {
      // Permission granted, get the current location
      try{
        // somethingThatExpectsLessThan10(12);
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

        latitude = position.latitude;
        longitude = position.longitude;
        print(position);
      }
      catch (e) {
        print(e);
      }
    }
    else {
      // Permission denied, handle accordingly
      print('Permission denied');
    }
  }

  }

// double temperature = decodedData['main']['temp'];
// int condition = decodedData['weather'][0]['id'];
// String cityName = decodedData['name'];