import 'dart:convert';

import 'package:dafaq_is_the_weather/Models/WeatherData.dart';
import 'package:dafaq_is_the_weather/Services/BaseService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class WeatherService
{
  BaseService Service = BaseService();
  
  Future RequestPermissions() async
  {
    var Status = await Permission.location.status;

    if(!Status.isGranted)
    {
      var NewStatus = await Permission.location.request();
    }
  }

  Future<String> GetWeather() async
  {
  
    await RequestPermissions();

    Position LocalPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    double Longitude = LocalPosition.longitude;
    double Latitude = LocalPosition.latitude;

    print("Long=$Longitude Lat=$Latitude");


    const APIKey = "85c1d4dbd65436f74bf556ce378bd188";

    String Resp = await Service.Request(
      "https://api.openweathermap.org/data/2.5/weather?lat=$Latitude&lon=$Longitude&appid=$APIKey&units=imperial", Method: "Get");
    return Resp;

  }

  Future<WeatherData> GetWeatherData() async
  {
    String Res = await GetWeather();
    return WeatherData.FromJson(jsonDecode(Res));
  }
}