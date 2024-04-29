import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skycast/data/my_data.dart';
import 'package:weather/weather.dart';

part 'skycast_event.dart';
part 'skycast_state.dart';

class SkycastBloc extends Bloc<SkycastEvent, SkycastState> {
  SkycastBloc() : super(SkycastInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(SkycastLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(SkycastSuccess(weather));
      } catch (e) {
        emit(SkycastFailure());
      }
    });
  }
}
