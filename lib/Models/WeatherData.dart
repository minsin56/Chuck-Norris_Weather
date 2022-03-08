class WeatherData
{
  WeatherData({required this.Tempurature, required this.MinTempurature,
   required this.MaxTempurature, required this.Humidity, required this.Wind, required this.DateText, required this.RainChance, 
  required this.WeatherMainType, required this.Location});
  double Tempurature;
  double MinTempurature;
  double MaxTempurature;
  double Humidity;
  double RainChance;
  double Wind;
  String DateText;
  String WeatherMainType;
  String Location;

  factory WeatherData.FromJson(int Index,Map<String,dynamic> Json) => WeatherData(
    
      Tempurature: Index == 0? Json["current"]["temp_f"].toDouble(): Json["forecast"]["forecastday"][Index]["day"]["avgtemp_f"].toDouble(),
      MinTempurature: Json["forecast"]["forecastday"][Index]["day"]["mintemp_f"].toDouble(),
      MaxTempurature: Json["forecast"]["forecastday"][Index]["day"]["maxtemp_f"].toDouble(),
      Humidity: Json["forecast"]["forecastday"][Index]["day"]["avghumidity"].toDouble(),
      Wind: Json["forecast"]["forecastday"][Index]["day"]["maxwind_mph"].toDouble(), 
      DateText: Json["forecast"]["forecastday"][Index]["date"].toString(), 
      RainChance: Json["forecast"]["forecastday"][Index]["day"]["daily_chance_of_rain"].toDouble(),
      WeatherMainType: Json["forecast"]["forecastday"][Index]["day"]["condition"]["text"].toString(),
      Location: Json["location"]["name"].toString()
    );
}