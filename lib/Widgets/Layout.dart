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
  final Controller = Get.put(WeatherService());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return      Container(
        padding: const EdgeInsets.all(20),

        child:
        FutureBuilder<WeatherData>(future: Controller.GetWeatherData(),
        builder: (CTX, Snapshot)
        {
          if(Snapshot.hasData)
          {
            var Data = Snapshot.data;
            var Wind = Data?.Wind;
            var WindDirection = Data?.WindDirection.toInt();
            var Temp = Data?.Tempurature.toInt();
            var Humidity = Data?.Humidity;

            var Time = Data?.CurrentTime;
            var SunriseTime = Data?.SunriseTime;
            var SunsetTime = Data?.SunsetTime;

            bool IsNight = (Time as double > (SunsetTime as double)) == true;

            var IconName = IsNight? "assets/Moon.svg": "assets/Sun.svg";

            var TimeText = IsNight? "Night": "Day";


            var Date = TimeOfDay.now();
            var Hour = Date.hour - 12;
            var Minute = Date.minute;
            var TimeOfDayValueText = "$Hour:$Minute";

            var Year = DateTime.now().year;
            var Month = DateTime.now().month;
            var Day = DateTime.now().day;

            var DateText = "$Day/$Month/$Year";

            return  Row(children:[ Expanded(
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
                              "THE CHUCK NORRIS FACT OF THE DAY, OH AND THE WEATHER",
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )
                          ),
                          SizedBox(height: 20,),
                          ChuckNorrisJoke(),
                          SizedBox(height: 20,),
                          Container(
                            child: GestureDetector(onTap: () => Controller.GetWeatherData(),
                            child:SvgPicture.asset("assets/Menu.svg", width: 30, height: 30, color: Colors.white) ,),
                          ),
                          SizedBox(height: 5,),
                          Text("$TimeOfDayValueText - Monday, Nov 9th 2022", style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),)
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
                              SvgPicture.asset(IconName, width: 34,height: 34),
                              SizedBox(width: 10,),
                              Text(TimeText, style: GoogleFonts.lato(
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
                                    Text("10", style: GoogleFonts.lato(
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
                                )
                              ],
                            ),
                          )
                      ),
                    ],
                  )
                ],
              ),
            )]);
          }

          return Container(
            child: Center(child: Column( mainAxisAlignment: MainAxisAlignment.center, children:
             [SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
             SizedBox(height: 20,),
             Text("Loading.................")],)),
          );
        }
        )
    );
  }
}