
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/location.dart';
import 'package:path/path.dart' as Path;

const spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }
  void getLocationData() async {
   WeatherModel weatherModel = WeatherModel();
   var weatherData = await weatherModel.getLocation();
   Navigator.push(context ,MaterialPageRoute(builder: (context){
     return LocationScreen(weatherData: weatherData);
   }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white10,
        size: 100.0
      ),
    );
  }
}
