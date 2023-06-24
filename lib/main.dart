import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/choose_location.dart';
import 'package:worldtimeapp/pages/loading.dart';
import 'package:worldtimeapp/pages/home.dart';

void main() => runApp(MaterialApp(
      // home:Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/locations': (context) => ChooseLocation()
      },
    ));
