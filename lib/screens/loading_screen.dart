import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = '8adda54034ac6803165a865af07007b0';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lati;
  double longi;

  void getLocation() async {
    Location l = Location();
    await l.currentLocation();
    longi = l.long;
    lati = l.lat;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$longi&appid=$apiKey');
    var weatherdata = await networkHelper.getDataurl();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
    //var t=jsonDecode(weatherdata)['main']['temp'];
    //var n=jsonDecode(weatherdata)['name'];
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color:Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
