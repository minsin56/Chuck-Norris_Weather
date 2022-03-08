import 'package:dafaq_is_the_weather/Models/WeatherData.dart';
import 'package:dafaq_is_the_weather/Services/WeatherService.dart';
import 'package:dafaq_is_the_weather/Widgets/Layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherApp extends StatelessWidget
{
  final Controller = Get.put(WeatherService());

  @override
  Widget build(BuildContext context) 
  {

    PageController Controller = PageController();
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
        FutureBuilder<List<WeatherData>>( future: this.Controller.GetWeatherForcest(),builder: (Ctx,Snapshop)
        {
          
          if(Snapshop.hasData)
          {
            List<Widget> Children = [];

            Snapshop.data?.forEach((Element) {
              Children.add(Layout(Data: Element));
            });

            return PageView(controller: Controller,children: Children);
          }

          return Center(child: Column( mainAxisAlignment: MainAxisAlignment.center, children:
           [const SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
           const SizedBox(height: 20,),
           Text("Loading.................", style: GoogleFonts.lato(color: Colors.white,fontSize: 30))],));
        })
      ])
    );
  }
}