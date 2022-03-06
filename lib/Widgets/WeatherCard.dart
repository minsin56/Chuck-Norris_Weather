
import 'package:dafaq_is_the_weather/Models/WeatherData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCard extends StatelessWidget
{
  WeatherCard({required this.Data});

  WeatherData? Data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
      Card(
            color: Colors.black38,
            child: 
            Column(mainAxisSize: MainAxisSize.min, children: [
              Text("Today", 
                    style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight:FontWeight.w500,
                    color: Colors.white
                  )),
                  SizedBox(height: 5,),
                  Column(children: [
                    Text("Temp",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),),
                    Text("22",
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),)
                  ],),
            ],),
          );             
  }
}