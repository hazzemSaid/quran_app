part of 'parytime_cubit.dart';

@immutable
abstract class ParytimeState {}

class ParytimeInitial extends ParytimeState {}

class ParytimeLoading extends ParytimeState {}

class ParytimeLoaded extends ParytimeState {
  final PrayerTimeModel praytimemodel;

  ParytimeLoaded(this.praytimemodel);
}

class ParytimeError extends ParytimeState {
  final String message;

  ParytimeError(this.message);
}
