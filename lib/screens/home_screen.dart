import 'package:flutter/material.dart';
import 'package:weatherapp_clima/models/weather_model.dart';
import 'package:weatherapp_clima/services/weather_services.dart';
import 'package:weatherapp_clima/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherServices _weatherServices = WeatherServices();

  final TextEditingController _controller = TextEditingController();

  bool _isLoading = false;

  Weather? _weather;

  void _getWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final weather = await _weatherServices.featchWeather(_controller.text);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error Fetching Weather Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: _weather != null &&
                    _weather!.description.toLowerCase().contains('rain')
                ? const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.blueGrey,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : _weather != null &&
                        _weather!.description.toLowerCase().contains('clear')
                    ? const LinearGradient(
                        colors: [
                          Colors.orangeAccent,
                          Colors.blueAccent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : LinearGradient(
                        colors: [
                          Colors.grey,
                          Colors.lightBlueAccent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'Weather App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: _controller,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    hintText: " Enter Your City Name",
                    hintStyle: const TextStyle(
                      color: Colors.white70,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(110, 255, 255, 255),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _getWeather,
                child: Text('Get weather', style: TextStyle(fontSize: 17)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(198, 189, 214, 231),
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                    
              ),
              if (_isLoading)
              Padding(padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
              ),
              if(_weather!=null)

                WeatherCard(weather: _weather!),

            ],
          ),
        )),
      ),
    );
  }
}
