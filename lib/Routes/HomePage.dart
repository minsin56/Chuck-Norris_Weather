import 'package:dafaq_is_the_weather/Widgets/WeatherApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/WeatherData.dart';
import '../Services/WeatherService.dart';
import '../Widgets/Layout.dart';

class HomePage extends StatelessWidget
{
  final Controller = Get.put(WeatherService());

  @override
  Widget build(BuildContext context)
  {
    PageController Controller = PageController();

    return WeatherApp(child:
      FutureBuilder<List<WeatherData>>( future: this.Controller.GetWeatherForcest(),builder: (Ctx,Snapshop)
      {

        if(Snapshop.hasData)
        {
          List<Widget> Children = [];

          Snapshop.data?.forEach((Element)
          {
            Children.add(Layout(Data: Element));
          });

          return PageView(controller: Controller,children: Children, scrollDirection: Axis.horizontal);

        }

        return Center(child: Column( mainAxisAlignment: MainAxisAlignment.center, children:
        [
          SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
          const SizedBox(height: 20,),
          Text("Loading.................", style: GoogleFonts.lato(color: Colors.white,fontSize: 30))
        ],
        ));
      })
    );
  }
}