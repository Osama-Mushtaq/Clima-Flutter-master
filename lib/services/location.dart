import 'package:geolocator/geolocator.dart';

class Location{
  double long,lat;

  Future<void> currentLocation()async{
    try{
      Position pos=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      long=pos.longitude;
      lat=pos.latitude;
    }
    catch(e){
      print(e);
    }
  }
}