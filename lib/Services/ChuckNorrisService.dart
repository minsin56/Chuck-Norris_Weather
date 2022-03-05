import 'dart:convert';

import 'package:dafaq_is_the_weather/Models/ChuckNorrisData.dart';

import "BaseService.dart";

class ChuckNorrisService
{
  BaseService Service = BaseService();

  Future<ChuckNorrisData> GetJoke() async
  {
    String URL = "https://api.chucknorris.io/jokes/random";

    String Res = await Service.Request(URL,Body: {},Method: "GET");
    var Json = jsonDecode(Res);
    return ChuckNorrisData(Data: Json["value"].toString());
  }
}