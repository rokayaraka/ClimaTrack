

class Weather{

  final String cityName;
  final double temparature;
  final String main;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrize;
  final int sunset;

  Weather({
  required this.cityName,
  required this.temparature,
  required this.main,
  required this.description,
  required this.humidity,
  required this.windSpeed,
  required this.sunrize,
  required this.sunset
  });





  factory Weather.fromJson(Map<String,dynamic> json){
    final weatherList = json['weather'] as List<dynamic>;
    final weather = weatherList.isNotEmpty ? weatherList[0] : {};
    
    return Weather(
      cityName: json['name'],
      temparature: (json['main']['temp'] as num).toDouble() - 273.15,
      main: weather['main'] ?? '',
      description: weather['description'] ?? '',
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      sunrize: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
    // return Weather(
    //   cityName: json['name'],
    //   temparature: json['main']['temp'] -273.15,
    //   description: json['weather']['description'],
    //   humidity: json['main']['humidity'],
    //   windSpeed: json['wind']['speed'],
    //   sunrize: json['sys']['sunrise'],
    //   sunset: json['sys']['sunset']
    //         );
  }
}

