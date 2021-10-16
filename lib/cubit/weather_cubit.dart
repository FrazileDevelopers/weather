import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/data/model/weather.dart';
import 'package:weather/data/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(const WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(const WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(const WeatherError(
          'Couldn\'t fetch the weather. Check the internet connection.'));
    }
  }
}
