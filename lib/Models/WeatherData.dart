class WeatherData
{
  WeatherData({required this.Tempurature, required this.Humidity, required this.Wind, required this.WindDirection, required this.DateText, required this.RainChance, 
  required this.WeatherMainType});
  double Tempurature;
  double Humidity;
  double RainChance;
  double Wind;
  double WindDirection;
  String DateText;
  String WeatherMainType;

  factory WeatherData.FromJson(int Index,Map<String,dynamic> Json) => WeatherData(Tempurature: Json["list"][Index]["main"]["temp"].toDouble(),
      Humidity: Json["list"][Index]["main"]["humidity"].toDouble(),
      Wind: Json["list"][Index]["wind"]["speed"].toDouble(), WindDirection: Json["list"][Index]["wind"]["deg"].toDouble(),
      DateText: Json["list"][Index]["dt_txt"].toString(), 
      RainChance: Json["list"][Index]["weather"][0]["main"].toString() == "Rain"? Json["list"][Index]["rain"]["3h"].toDouble():0.0,
      WeatherMainType: Json["list"][Index]["weather"][0]["main"].toString()
      );
}