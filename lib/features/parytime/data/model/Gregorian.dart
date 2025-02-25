import 'package:quran_app/features/parytime/data/model/Designation.dart';
import 'package:quran_app/features/parytime/data/model/Month.dart';
import 'package:quran_app/features/parytime/data/model/Weekday.dart';

class Gregorian {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;
  final bool lunarSighting;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.lunarSighting,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: Weekday.fromJson(json['weekday']),
      month: Month.fromJson(json['month']),
      year: json['year'],
      designation: Designation.fromJson(json['designation']),
      lunarSighting: json['lunarSighting'],
    );
  }
}
