import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double lat, long;
  Future<dynamic> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      long = position.longitude;
    }
    catch(e){
      print(e) ;
    }
  }
}