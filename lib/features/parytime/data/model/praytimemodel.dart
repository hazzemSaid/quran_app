import 'package:quran_app/features/parytime/data/model/Gregorian.dart'
    show Gregorian;
import 'package:quran_app/features/parytime/data/model/Hijri.dart';

class Praytimemodel {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String day;
  final String readable;
  final String timestamp;
  final Hijri hijri;
  final Gregorian gregorian;

  Praytimemodel({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.day,
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory Praytimemodel.fromJson(Map<String, dynamic> json) {
    return Praytimemodel(
      fajr: json['fajr'],
      dhuhr: json['dhuhr'],
      asr: json['asr'],
      maghrib: json['maghrib'],
      isha: json['isha'],
      day: json['day'],
      readable: json['readable'],
      timestamp: json['timestamp'],
      hijri: Hijri.fromJson(json['hijri']),
      gregorian: Gregorian.fromJson(json['gregorian']),
    );
  }
}
