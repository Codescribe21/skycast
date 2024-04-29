part of 'skycast_bloc.dart';

sealed class SkycastEvent extends Equatable {
  const SkycastEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends SkycastEvent {
  final Position position;

  const FetchWeather(this.position);

  @override
  List<Object> get props => [position];
}
