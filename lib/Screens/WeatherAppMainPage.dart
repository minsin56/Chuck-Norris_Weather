
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WeatherApp extends StatelessWidget
{
  WeatherApp({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) 
  {

    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text(""),
          elevation: 0,
          backgroundColor: Color.fromARGB(0, 168, 154, 154),
        
      ),
      body: Stack(children: [
        Image.asset('assets/BG_Day-01.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity),
        Container(
          decoration: BoxDecoration(color: Colors.black38),
        ),
        child
      ])
    );
  }
}