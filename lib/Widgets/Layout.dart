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
    var MinTemp = Data?.MinTempurature;
    var MaxTemp = Data?.MaxTempurature;

    var TimeText = Data?.DateText;
    var RainChance = Data?.RainChance;

    var Wind = Data?.Wind;
    var Humidity = Data?.Humidity;
    var WeatherMainType = Data?.WeatherMainType;

    var StartDateText= Data?.DateText;
    var CurrentDateText = "$StartDateText";
    var Location = Data?.Location;
    
    if(WeatherMainType == "Clouds")
    {
      WeatherMainType = "Cloudy";
    }

    double RainBarWidth = 0;
    Color RainBarColor = Colors.greenAccent;
    if(RainChance != null)
    {
      RainBarWidth = RainChance / 2;

      if(RainChance > 50)
      {
        RainBarColor = Colors.redAccent;
      }
    }

    List<String> DateSplit = [];
    DateSplit.addAll(CurrentDateText.split("-"));

    var DateText = DateSplit[1] + "/" + DateSplit[2] + "/" + DateSplit[0];

    return      Container(
        padding: const EdgeInsets.all(20),

        child:
          Row(children:[ Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Column(children: [
                                  Text("$Temp \u00B0\u0046", style: GoogleFonts.lato(
                                    fontSize: 80,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white
                                  ),),
                                  Text("Minimum $MinTemp \u00B0\u0046", style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white
                                  ),),
                                  Text("Maximum $MaxTemp \u00B0\u0046", style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white
                                  ),),                                  
                           ],),
                          
                        ],
                      ),
                      Column(
                        children: [
                           SizedBox(height: 40,),
                                      Text(DateText, style: GoogleFonts.lato(
                                  fontSize: 25,
                                  fontWeight:FontWeight.w500,
                                  color: Colors.white,
                                  textBaseline: TextBaseline.alphabetic
                              )),
                                 Text("$WeatherMainType", style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                        
                            
                              SizedBox(height: 30,),
                          
                        ],
                      ),

                      Container(
                        margin:  EdgeInsets.symmetric(vertical: 80),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.transparent
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
                                            width: RainBarWidth,
                                            color: RainBarColor
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