import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WorldTime{
  late String location;
  late String time;
  late String flag; // would be a url to the flag
  late String url ;
  WorldTime({required this.location, required this.flag, required this.url }){

  }
  Future<void> getTime() async {
    try{
      Response response = await get(Uri(
          scheme: 'http',
          host: 'worldtimeapi.org',
          path: 'api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime= data['datetime'];
      String offset= data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);

      now=now.add(Duration(hours: int.parse(offset)));
      //setting the time property
      time= now.toString();

    }
    catch (e){
      print('$e');
      time='could not get time data';
    }





  }

}


