import 'dart:convert';

import 'package:dafaq_is_the_weather/APIKeys.dart';
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

      if(NewStatus.isPermanentlyDenied)
      {
        await openAppSettings();
      }
    }
  }

  Future<String> GetWeather() async
  {
  
    await RequestPermissions();

    Position LocalPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    double Longitude = LocalPosition.longitude;
    double Latitude = LocalPosition.latitude;



    String Resp = await Service.Request(
      "http://api.weatherapi.com/v1/forecast.json?key=$WeatherAPIKey &q=$Latitude,$Longitude &days=7", Method: "Get");
    return Resp;

  }

  Future<WeatherData> GetWeatherData(int Index) async
  {
    String Res = await GetWeather();
    return WeatherData.FromJson(Index,jsonDecode(Res));
  }

  Future<List<WeatherData>> GetWeatherForcest() async
  {
    String Res = await GetWeather();

    List<WeatherData> Data = [];
  
    double Count = jsonDecode(Res)["forecast"]["forecastday"].length.toDouble();

    double TempMin = 0,TempMax = 0;

    double PrevDay = -1;

    for(int i = 0; i < (Count).toInt(); i ++)
    {
      var Json = jsonDecode(Res);

      var Item = Json["forecast"]["forecastday"][i];

      var Date = Item["date"];

      var Split = Date.toString().split('-'); //parse the date
      var Day = double.parse(Split[2]);
      Data.add(WeatherData.FromJson(i,jsonDecode(Res)));


      if(Day > PrevDay)
      {

        PrevDay = Day;
      }
    } 



    return Data;
  }
}