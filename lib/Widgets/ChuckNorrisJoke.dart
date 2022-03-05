import 'package:dafaq_is_the_weather/Models/ChuckNorrisData.dart';
import "package:dafaq_is_the_weather/Services/ChuckNorrisService.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ChuckNorrisJoke extends StatelessWidget
{
  final Controller = Get.put(ChuckNorrisService());
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<ChuckNorrisData>(future: Controller.GetJoke(),builder: (Ctx, Snapshot)
    {
      if(Snapshot.hasData)
      {
        var Joke = Snapshot.data?.Data;
        return Text(
                     Joke as String,
                     style: GoogleFonts.lato(
                         fontSize: 14,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                        )
                    );
      }
      return Text("GETTING YOUR CHUCK NORRIS FACT OF THE DAY, PLEASE LOOK AT THE WEATHER WHILE YOU ARE WAITING",
      style: GoogleFonts.lato(
                         fontSize: 14,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                        ));
    } );
    
  }
}