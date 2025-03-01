import 'package:hive/hive.dart';

part 'praytimemodel.g.dart';

@HiveType(typeId: 0) // Unique ID for the class
class PrayerTimeModel extends HiveObject {
  @HiveField(0)
  final int code;

  @HiveField(1)
  final String status;

  @HiveField(2)
  final Data data;

  PrayerTimeModel({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerTimeModel.fromMap(Map<String, dynamic> json) => PrayerTimeModel(
        code: json["code"],
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );
}

class Data {
  final Timings timings;
  final Date date;
  final Meta meta;

  Data({
    required this.timings,
    required this.date,
    required this.meta,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        timings: Timings.fromMap(json["timings"]),
        date: Date.fromMap(json["date"]),
        meta: Meta.fromMap(json["meta"]),
      );
}

class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  final String firstThird;
  final String lastThird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstThird,
    required this.lastThird,
  });

  factory Timings.fromMap(Map<String, dynamic> json) => Timings(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        imsak: json["Imsak"],
        midnight: json["Midnight"],
        firstThird: json["Firstthird"],
        lastThird: json["Lastthird"],
      );
}

class Date {
  final String readable;
  final String timestamp;
  final Hijri hijri;
  final Gregorian gregorian;

  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  factory Date.fromMap(Map<String, dynamic> json) => Date(
        readable: json["readable"],
        timestamp: json["timestamp"],
        hijri: Hijri.fromMap(json["hijri"]),
        gregorian: Gregorian.fromMap(json["gregorian"]),
      );
}

class Hijri {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;

  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  factory Hijri.fromMap(Map<String, dynamic> json) => Hijri(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: Weekday.fromMap(json["weekday"]),
        month: Month.fromMap(json["month"]),
        year: json["year"],
        designation: Designation.fromMap(json["designation"]),
      );
}

class Gregorian {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  factory Gregorian.fromMap(Map<String, dynamic> json) => Gregorian(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: Weekday.fromMap(json["weekday"]),
        month: Month.fromMap(json["month"]),
        year: json["year"],
        designation: Designation.fromMap(json["designation"]),
      );
}

class Weekday {
  final String en;
  final String? ar;

  Weekday({required this.en, this.ar});

  factory Weekday.fromMap(Map<String, dynamic> json) => Weekday(
        en: json["en"],
        ar: json["ar"],
      );
}

class Month {
  final int number;
  final String en;
  final String? ar;

  Month({required this.number, required this.en, this.ar});

  factory Month.fromMap(Map<String, dynamic> json) => Month(
        number: json["number"],
        en: json["en"],
        ar: json["ar"],
      );
}

class Designation {
  final String abbreviated;
  final String expanded;

  Designation({required this.abbreviated, required this.expanded});

  factory Designation.fromMap(Map<String, dynamic> json) => Designation(
        abbreviated: json["abbreviated"],
        expanded: json["expanded"],
      );
}

class Meta {
  final double latitude;
  final double longitude;
  final String timezone;
  final Method method;
  final String latitudeAdjustmentMethod;
  final String midnightMode;
  final String school;
  final Map<String, int> offset;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        timezone: json["timezone"],
        method: Method.fromMap(json["method"]),
        latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
        midnightMode: json["midnightMode"],
        school: json["school"],
        offset:
            Map.from(json["offset"]).map((k, v) => MapEntry<String, int>(k, v)),
      );
}

class Method {
  final int id;
  final String name;
  final Params params;
  final Location location;

  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  factory Method.fromMap(Map<String, dynamic> json) => Method(
        id: json["id"],
        name: json["name"],
        params: Params.fromMap(json["params"]),
        location: Location.fromMap(json["location"]),
      );
}

class Params {
  final int fajr;
  final int isha;

  Params({required this.fajr, required this.isha});

  factory Params.fromMap(Map<String, dynamic> json) => Params(
        fajr: json["Fajr"],
        isha: json["Isha"],
      );
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );
}
