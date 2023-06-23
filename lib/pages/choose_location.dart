import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}
class _ChooseLocationState extends State<ChooseLocation> {
  int counter=1;
  @override
  Widget build(BuildContext context) {
    print('initstate functions is being run');
    return  Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Choose a Location'),
        centerTitle:true,
        elevation:0 ,
      ),
      body:ElevatedButton(
        onPressed: (){
          setState(() {
            counter+=1;
          });
        },
        child: Text('counter is $counter '),

      )
    );
  }
}
