import 'package:dafaq_is_the_weather/Models/WeatherData.dart';
import 'package:dafaq_is_the_weather/Widgets/ChuckNorrisJoke.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import "package:dafaq_is_the_weather/Services/WeatherService.dart";

class Layout extends StatelessWidget
{
  Layout({required this.Data});
  WeatherData? Data;


  @override
  Widget build(BuildContext context)
  {

    var Temp = Data?.Tempurature;
    var TimeText = Data?.DateText;
    var RainChance = Data?.RainChance;

    var Wind = Data?.Wind;
    var WindDirection = Data?.WindDirection;
    var Humidity = Data?.Humidity;
    var WeatherMainType = Data?.WeatherMainType;
    var DateText = Data?.DateText;

    return      Container(
        padding: const EdgeInsets.all(20),

        child:
          Row(children:[ Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 80),

                          Text(
                              "THE CHUCK NORRIS FACTS OF THE DAY",
                              style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )
                          ),
                          SizedBox(height: 20,),
                          ChuckNorrisJoke(),
                          SizedBox(height: 20,),
      
                          SizedBox(height: 5,),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$Temp \u00B0\u0046", style: GoogleFonts.lato(
                              fontSize: 80,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
//                              SvgPicture.asset(IconName, width: 34,height: 34),
                              SizedBox(width: 10,),
                              Text(TimeText.toString(), style: GoogleFonts.lato(
                                  fontSize: 25,
                                  fontWeight:FontWeight.w500,
                                  color: Colors.white
                              ))
                            ],
                          )
                        ],
                      ),

                      Container(
                        margin:  EdgeInsets.symmetric(vertical: 40),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white30
                            )
                        ),
                      ),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("Wind", style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                    Text(Wind.toString(), style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                    Text("mph", style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
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
                                            color: Colors.greenAccent
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Rain", style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                    Text("$RainChance", style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                    Text("%", style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
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
                                ),
                                Column(
                                  children: [
                                    Text("Humidity", style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                    Text("$Humidity", style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                    Text("%", style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
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
                                ),
                                 Column(
                                  children: [
                                    Text("Wind Direction", style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                    Text("$WindDirection", style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                    Text("Deg", style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
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
                                ),
                                 Column(
                                  children: [
                                    Text("Weather", style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                    Text("$WeatherMainType", style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                    Text("type", style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
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
                                ),
                              ],
                            ),
                          )
                      ),
                    ],
                  )
                ],
              ),
            )])
    );
  }
}