import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherStat extends StatelessWidget
{

  WeatherStat({required this.StatName,
    required this.StatValue,
    required this.StatValueTypeText});

  String StatName;
  String StatValue;
  String StatValueTypeText;

  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return
        Column(
          children: [
            Text("$StatName", style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )),
            Text("$StatValue", style: GoogleFonts.lato(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )),
            Text("$StatValueTypeText",
                style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                )
            ),
            Stack(
              children: [
                Container(
                  height: 5,
                  width: 50,
                  color: Colors.white38
                ),
                Container(
                    height: 5,
                    width: 5,
                    color: Colors.redAccent
                )
              ],
            )
          ],
        );
  }
}