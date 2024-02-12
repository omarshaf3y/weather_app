import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Patchy light drizzle':
    case 'Light rain':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
      return Colors.blueGrey;
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
      return Colors.blueGrey;
    case 'Thundery outbreaks possible':
      return Colors.yellow;
    case 'Blowing snow':
    case 'Blizzard':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.blueGrey;
    case 'Patchy light rain':
    case 'Patchy light sleet':
    case 'Light sleet':
    case 'Light freezing rain':
      return Colors.blueGrey;
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy freezing rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.blueGrey;
    case 'Light rain shower':
    case 'Patchy light rain with thunder':
      return Colors.yellow;
    case 'Light snow shower':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.red;
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    default:
      return Colors.grey;
  }
}
