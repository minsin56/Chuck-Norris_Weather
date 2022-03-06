class WeatherData
{
  WeatherData({required this.Tempurature, required this.Humidity, required this.Wind, required this.WindDirection, required this.DateText});
  double Tempurature;
  double Humidity;
  double Wind;
  double WindDirection;
  String DateText;

  factory WeatherData.FromJson(int Index,Map<String,dynamic> Json) => WeatherData(Tempurature: Json["list"][Index]["main"]["temp"].toDouble(),
      Humidity: Json["list"][Index]["main"]["humidity"].toDouble(),
      Wind: Json["list"][Index]["wind"]["speed"].toDouble(), WindDirection: Json["list"][Index]["wind"]["deg"].toDouble(),
      DateText: Json["list"][Index]["dt_txt"].toString()
      );
}