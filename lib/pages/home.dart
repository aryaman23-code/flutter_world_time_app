import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/home.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {
    //using this to collect the arguemnts from  the routes
    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
    }
    catch (e) {
      data = data;
    }
    print(data);
    return  Scaffold(
      body:SafeArea(
        child: Column(
          children: <Widget>[
            TextButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/locations');
                },
                icon: Icon(Icons.edit_location),
              label:Text('Edit Locations') ,
            )
          ],

        ),
      )
    );
  }
}




