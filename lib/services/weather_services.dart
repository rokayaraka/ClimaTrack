import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherapp_clima/models/weather_model.dart';

class WeatherServices {
  final String apiKey = '255ffdb4187b35ad2ac7667bf3718b06';

  Future<Weather> featchWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Weather Data');
    }
  }
}
