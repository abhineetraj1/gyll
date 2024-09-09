import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherChecker(),
    );
  }
}

class WeatherChecker extends StatefulWidget {
  @override
  _WeatherCheckerState createState() => _WeatherCheckerState();
}

class _WeatherCheckerState extends State<WeatherChecker> {
  String _status = 'Checking...';

  @override
  void initState() {
    super.initState();
    _checkWeather();
  }

  Future<void> _checkWeather() async {
    Position position = await Geolocator.getCurrentPosition();
    String state = await _getStateFromCoordinates(position.latitude, position.longitude);

    if (state == null) {
      setState(() {
        _status = 'Unable to determine state.';
      });
      return;
    }

    bool isCoastal = _checkIfCoastal(state);
    if (!isCoastal) {
      setState(() {
        _status = 'The state does not have a coastal region.';
      });
      return;
    }

    String weather = await _getWeather(state);
    setState(() {
      _status = weather;
    });
  }

  Future<String> _getStateFromCoordinates(double latitude, double longitude) async {
    // Comprehensive static mapping of coordinates to states
    final stateMap = {
      '12.9716,77.5946': 'Karnataka', // Bangalore
      '19.0760,72.8777': 'Maharashtra', // Mumbai
      '22.5726,88.3639': 'West Bengal', // Kolkata
      '28.6139,77.2090': 'Delhi', // Delhi
      '13.0827,80.2707': 'Tamil Nadu', // Chennai
      '15.2993,74.1240': 'Goa', // Panaji
      '23.0225,72.5714': 'Gujarat', // Ahmedabad
      '17.3850,78.4867': 'Telangana', // Hyderabad
      '19.9975,73.7898': 'Maharashtra', // Pune
      '26.9124,75.7873': 'Rajasthan', // Jaipur
      '30.7333,76.7794': 'Punjab', // Chandigarh
      '20.2961,85.8245': 'Odisha', // Bhubaneswar
      '11.0168,76.9558': 'Kerala', // Cochin
      // Add more coordinates and states as needed
    };

    String key = '$latitude,$longitude';
    return stateMap[key] ?? 'Unknown State';
  }

  bool _checkIfCoastal(String state) {
    // Coastal states in India
    final coastalStates = [
      'Andhra Pradesh',
      'Goa',
      'Gujarat',
      'Karnataka',
      'Kerala',
      'Maharashtra',
      'Odisha',
      'Tamil Nadu'
    ];
    return coastalStates.contains(state);
  }

  Future<String> _getWeather(String state) async {
    final apiKey = dotenv.env['WEATHER_API_KEY'];
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$state,IN&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final weather = data['weather'][0]['description'];
      final temp = data['main']['temp'];
      final safety = (temp > 0 && temp < 35) ? 'Safe to travel' : 'Not safe to travel';

      return 'Weather: $weather\nTemperature: $temp°C\nSafety: $safety';
    } else {
      return 'Failed to fetch weather data';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Checker'),
      ),
      body: Center(
        child: Text(_status),
      ),
    );
  }
}
