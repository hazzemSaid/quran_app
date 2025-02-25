import 'package:quran_app/features/parytime/data/model/Designation.dart';
import 'package:quran_app/features/parytime/data/model/Month.dart';
import 'package:quran_app/features/parytime/data/model/Weekday.dart';
import 'package:quran_app/features/parytime/data/model/praytimemodel.dart';

class Hijri {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;
  final List<dynamic> holidays;
  final List<dynamic> adjustedHolidays;
  final String method;

  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
    required this.adjustedHolidays,
    required this.method,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: Weekday.fromJson(json['weekday']),
      month: Month.fromJson(json['month']),
      year: json['year'],
      designation: Designation.fromJson(json['designation']),
      holidays: json['holidays'],
      adjustedHolidays: json['adjustedHolidays'],
      method: json['method'],
    );
  }
}
