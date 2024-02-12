import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCubit = BlocProvider.of<GetWeatherCubit>(context);

    WeatherModel? weatherModel = weatherCubit.weatherModel;

    final LinearGradient linearGradient = LinearGradient(
      colors: [
        getThemeColor(weatherModel?.weatherCondition ??
            ''), // Provide a default value or handle null accordingly
        getThemeColor(weatherModel?.weatherCondition ?? '')[300]!,
        getThemeColor(weatherModel?.weatherCondition ?? '')[50]!,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: linearGradient,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.fetchWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              labelText: 'Search',
              suffixIconColor: Colors.blue,
              suffixIcon: Icon(
                Icons.search,
              ),
              hintText: 'Enter City Name...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
