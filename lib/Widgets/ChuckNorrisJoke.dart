import 'package:auto_size_text/auto_size_text.dart';
import 'package:dafaq_is_the_weather/Models/ChuckNorrisData.dart';
import "package:dafaq_is_the_weather/Services/ChuckNorrisService.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
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
        return
            FadeIn(child:
                Container(
                    child:
                    Text(
                      Joke.toString(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                  ),
              duration: const Duration(milliseconds: 500), curve: Curves.easeIn
        );
      }
      return FadeIn(child: Text(
          "GETTING YOUR CHUCK NORRIS FACT OF THE DAY, PLEASE LOOK AT THE WEATHER WHILE YOU ARE WAITING",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white
          )),
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    } );
    
  }
}