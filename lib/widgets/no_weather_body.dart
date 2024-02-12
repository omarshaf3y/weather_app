import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There Is No Weather 😔 Start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'Searching Now... 🔍',
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
