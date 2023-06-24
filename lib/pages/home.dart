// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    //using this to collect the arguemnts from  the routes
    try {
      data = data.isNotEmpty
          ? data
          : ModalRoute.of(context)!.settings.arguments as Map;
    } catch (e) {
      data = data;
    }
    print(data);

    String bgimage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgcolor = data['isDaytime']
        ? Color.fromARGB(255, 0, 0, 0)
        : const Color.fromARGB(255, 15, 33, 47);

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: bgcolor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/$bgimage'), fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                  child: TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/locations');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: const Color.fromARGB(255, 95, 94, 94),
                    ),
                    label: Text(
                      'Edit Locations',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 70, 69, 69)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                        style: TextStyle(fontSize: 28, letterSpacing: 2)),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66),
                ),
              ],
            ),
          ),
        ));
  }
}
