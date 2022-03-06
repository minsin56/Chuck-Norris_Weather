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
          backgroundColor: Colors.transparent,
          leading: IconButton
            (
              icon:
                Icon(Icons.search, size:30, color: Colors.white), onPressed: () {  },
            ),
          actions:
          [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: GestureDetector(
                onTap: () => print("Hello"),
                child:  SvgPicture.asset("assets/Menu.svg", width: 30, height: 30, color: Colors.white)
              )
            )
          ],
      ),
      body: Stack(children: [
        Image.asset('assets/BG_Day.png',
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

          return Container(
            child: Center(child: Column( mainAxisAlignment: MainAxisAlignment.center, children:
             [SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
             SizedBox(height: 20,),
             Text("Loading.................")],)),
          );
        })
      ])
    );
  }
}