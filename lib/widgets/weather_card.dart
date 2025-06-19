import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp_clima/models/weather_model.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget{

final Weather weather;


 const WeatherCard({super.key, required this.weather});


String formatTime(int timestemp, DateTime date)
{
  return DateFormat('hh:mm a').format(date);

}


 @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 211, 204, 204)
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Lottie.asset(
              weather.description.contains('rain')
              ? 'Asset/rain.json'
              :weather.description.contains('clear')
              ? 'Asset/sunny.json'
              : 'Asset/cloudy.json',


              height: 150,
              width: 150,
            ),
            Text(
              weather.cityName,
              style: Theme.of(context).textTheme.headlineSmall,

            ),

            SizedBox(height: 10,),

            Text(
              '${weather.temparature.toStringAsFixed(1)}°C',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10,),

               Text(
                weather.description,
                style: Theme.of(context).textTheme.titleMedium,
               ),
            SizedBox(height: 20,),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Humidity: ${weather.humidity}%',
                style: Theme.of(context).textTheme.bodyMedium,

              ),

               Text(
                'WindSpeed: ${weather.windSpeed}m/s',
                style: Theme.of(context).textTheme.bodyMedium,

              ),

            ],
           ),
          SizedBox(height: 20,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.wb_sunny_outlined,
              color: Colors.orange,
              ),
              Text(
                'Sunrize',
                style: Theme.of(context).textTheme.bodyMedium,

              ),

              Text(
                formatTime(weather.sunrize, DateTime.fromMillisecondsSinceEpoch(weather.sunrize * 1000)),
                style: Theme.of(context).textTheme.bodyMedium,

              ),

                ],
              ),
              

              Column(
                children: [
                  Icon(Icons.nights_stay_outlined,
              color: Colors.purple,
              ),
              Text(
                'Sunrset',
                style: Theme.of(context).textTheme.bodyMedium,

              ),

              Text(
                formatTime(weather.sunset, DateTime.fromMillisecondsSinceEpoch(weather.sunset * 1000)),
                style: Theme.of(context).textTheme.bodyMedium,

              ),

                ],
              ),


               

            ],

           ),

          ],
        ),
      )
      ],
    );
  }
}