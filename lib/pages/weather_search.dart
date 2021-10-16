import 'package:flutter/material.dart';
import 'package:weather/data/model/weather.dart';

class WeatherSearch extends StatefulWidget {
  const WeatherSearch({Key? key}) : super(key: key);

  @override
  _WeatherSearchState createState() => _WeatherSearchState();
}

class _WeatherSearchState extends State<WeatherSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Search'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        // TODO: Implement with cubit
        child: buildInitialInput(),
      ),
    );
  }

  Widget buildInitialInput() => Center(
        child: CityInputField(),
      );

  Widget buildLoading() => Center(
        child: CircularProgressIndicator(),
      );

  Column buildColumnWithData(Weather weather) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            weather.cityName,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
            style: TextStyle(fontSize: 80),
          ),
          CityInputField(),
        ],
      );
}

class CityInputField extends StatelessWidget {
  const CityInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (val) => submitCityName(context, val),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Enter a city',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          suffix: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    // TODO: Get weather for the city
  }
}
