import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'data_storage_hive_state.dart';

class DataStorageHiveCubit extends Cubit<DataStorageHiveState> {
  DataStorageHiveCubit() : super(DataStorageHiveInitial());
  final Box box = Hive.box('appBox');
  TimeOfDay? time_morning_z;
  TimeOfDay? time_night_z;
  bool remaind_morning = false;
  bool remaind_night = false;
  Map<String, int> timeOfDayToMap(TimeOfDay time) {
    return {'hour': time.hour, 'minute': time.minute};
  }

  TimeOfDay mapToTimeOfDay(Map<String, int> map) {
    return TimeOfDay(hour: map['hour']!, minute: map['minute']!);
  }

  void loadDataFromHive() {
    emit(DataStorageHiveLoading());
    try {
      var morningMap =
          box.get('time_morning_z', defaultValue: {'hour': 6, 'minute': 0});
      var nightMap =
          box.get('time_night_z', defaultValue: {'hour': 18, 'minute': 0});

      time_morning_z = mapToTimeOfDay(Map<String, int>.from(morningMap));
      time_night_z = mapToTimeOfDay(Map<String, int>.from(nightMap));

      remaind_morning = box.get('remaind_morning', defaultValue: false);
      remaind_night = box.get('remaind_night', defaultValue: false);

      emit(DataStorageHiveSuccess());
    } catch (e) {
      emit(DataStorageHiveFailure(e.toString()));
    }
  }

  void saveDataToHive(
      {TimeOfDay? time_morning_z,
      TimeOfDay? time_night_z,
      bool? remaind_morning,
      bool? remaind_night}) {
    if (time_morning_z != null) {
      box.put('time_morning_z', timeOfDayToMap(time_morning_z!));
    }
    if (time_night_z != null) {
      box.put('time_night_z', timeOfDayToMap(time_night_z!));
    }
    box.put('remaind_morning', remaind_morning);
    box.put('remaind_night', remaind_night);
  }
}
