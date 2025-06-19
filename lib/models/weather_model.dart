class Weather{

  final String cityName;
  final double temparature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrize;
  final int sunset;

  Weather({
  required this.cityName,
   required this.temparature,
  required this.description,
  required this.humidity,
  required this.windSpeed,
  required this.sunrize,
  required this.sunset
  });





  factory Weather.fromJson(Map<String,dynamic> json){

    return Weather(
      cityName: json['name'],
      temparature: json['main']['temp'] -273.15,
      description: json['weather']['description'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      sunrize: json['sys']['sunrise'],
      sunset: json['sys']['sunset']
            );
  }
}