part of 'skycast_bloc.dart';

sealed class SkycastState extends Equatable {
  const SkycastState();

  @override
  List<Object> get props => [];
}

final class SkycastInitial extends SkycastState {}

final class SkycastLoading extends SkycastState {}

final class SkycastFailure extends SkycastState {}

final class SkycastSuccess extends SkycastState {
  final Weather weather;

  const SkycastSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}
