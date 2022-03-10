import 'package:dafaq_is_the_weather/Models/WeatherData.dart';
import 'package:dafaq_is_the_weather/Widgets/ChuckNorrisJoke.dart';
import 'package:dafaq_is_the_weather/Widgets/WeatherStat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    var RainChance = Data?.RainChance;

    var Wind = Data?.Wind;
    var Humidity = Data?.Humidity;
    var WeatherMainType = Data?.WeatherMainType;

    var StartDateText= Data?.DateText;
    var CurrentDateText = "$StartDateText";

    var FIcon = Data?.WeatherIcon;
    
    if(WeatherMainType == "Clouds")
    {
      WeatherMainType = "Cloudy";
    }

    List<String> DateSplit = [];
    DateSplit.addAll(CurrentDateText.split("-"));

    var DateText = DateSplit[1] + "/" + DateSplit[2] + "/" + DateSplit[0];

    return Container(
        padding: const EdgeInsets.all(20),

        child:
          Row(children:[
            Expanded(
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20,),

                      Text(
                          "THE CHUCK NORRIS FACTS OF THE DAY",
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )
                      ),

                      SizedBox(height: 10,),

                      ChuckNorrisJoke(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      SizedBox(height: 0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                SizedBox(height: 20,),
                                SizedBox(height: 20,),

                                SizedBox(height: 5,),
                              ],
                            ),
                          ],
                        ),
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
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),),
                                Text("Minimum $MinTemp \u00B0\u0046", style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),),
                                Text("Maximum $MaxTemp \u00B0\u0046", style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),),
                              ],),

                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 20,),
                              Text(DateText, style: GoogleFonts.lato(
                                  fontSize: 25,
                                  fontWeight:FontWeight.w500,
                                  color: Colors.white,
                                  textBaseline: TextBaseline.alphabetic
                              )),
                              Column(
                                children: [
                                  Image.network("https:$FIcon"),
                                  Text("$WeatherMainType", style: GoogleFonts.lato(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),),
                                ],
                              ),



                            ],
                          ),

                          Container(
                            margin:  EdgeInsets.symmetric(vertical: 70),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.transparent
                                )
                            ),
                          ),
                          Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    WeatherStat
                                    (
                                        StatName: "Wind",
                                        StatValue: "$Wind",
                                        StatValueTypeText: "MPH"
                                    ),
                                    WeatherStat
                                    (
                                        StatName: "Rain",
                                        StatValue: "$RainChance",
                                        StatValueTypeText: "%"
                                    ),
                                    WeatherStat
                                    (
                                        StatName: "Humidity",
                                        StatValue: "$Humidity",
                                        StatValueTypeText: "%"
                                    )

                                  ],
                                ),
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )
            )
          ])
    );
  }
}