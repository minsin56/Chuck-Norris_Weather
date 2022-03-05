class WeatherData
{
  WeatherData({required this.Tempurature, required this.Humidity, required this.Wind, required this.WindDirection, required this.CurrentTime, required this.SunriseTime, required this .SunsetTime});
  double Tempurature;
  double Humidity;
  double Wind;
  double WindDirection;
  double CurrentTime;
  double SunriseTime;
  double SunsetTime;

  factory WeatherData.FromJson(Map<String,dynamic> Json) => WeatherData(Tempurature: Json["main"]["temp"].toDouble(),
      Humidity: Json["main"]["humidity"].toDouble(),
      Wind: Json["wind"]["speed"].toDouble(), WindDirection: Json["wind"]["deg"].toDouble(),
      CurrentTime: Json["dt"].toDouble(),SunriseTime: Json["sys"]["sunrise"].toDouble(), SunsetTime: Json["sys"]["sunset"].toDouble());
}