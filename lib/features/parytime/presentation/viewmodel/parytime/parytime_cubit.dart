import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart' as intl;
import 'package:meta/meta.dart';
import 'package:quran_app/features/parytime/data/api/parytimeAPI.dart';

import '../../../data/model/praytimemodel.dart'
    show PrayerTimeModel, Praytimemodel;

part 'parytime_state.dart';

class ParytimeCubit extends Cubit<ParytimeState> {
  ParytimeCubit() : super(ParytimeInitial());

  final ParytimeAPI _parytimeAPI = ParytimeAPI();

  Future<void> getParytime() async {
    emit(ParytimeLoading());
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(ParytimeError("Location services are disabled."));
        return;
      }

      // Request permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(ParytimeError("Location permission denied."));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(ParytimeError("Location permission is permanently denied."));
        return;
      }

      // Get the current location
      Position position = await Geolocator.getCurrentPosition();
      double latitude = position.latitude;
      double longitude = position.longitude;

      // Format the date as 'yyyy-MM-dd'
      final String date = intl.DateFormat('dd-MM-yyyy').format(DateTime.now());

      // Fetch prayer times using API
      try {
        final parytime = await _parytimeAPI.getPraytime(
          date: date,
          latitude: latitude,
          longitude: longitude,
        );
        final praytimemodel = PrayerTimeModel.fromMap(parytime.data);
        emit(ParytimeLoaded(praytimemodel));
        return;
      } catch (e) {
        emit(ParytimeError(e.toString()));
        return;
      }
    } catch (e) {
      emit(ParytimeError(e.toString()));
    }
  }
}
