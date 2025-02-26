import 'package:quran_app/features/parytime/data/model/praytimemodel.dart';

class StreamingParyTime {
  // Stream<ParyTime> get paryTimeStream;
  static Stream<List> func({required PrayerTimeModel times}) async* {
    while (true) {
      Duration smallest_times_remaind = Duration(days: 1);
      List<String> prayerTimes = [
        times.data.timings.fajr,
        times.data.timings.sunrise,
        times.data.timings.dhuhr,
        times.data.timings.asr,
        times.data.timings.maghrib,
        times.data.timings.isha,
        times.data.timings.sunrise,
      ];
      List<String> prayname = [
        'الفجر',
        'لشروق',
        'الظهر',
        'العصر',
        'المغرب',
        'العشاء',
        'الشروق',
      ];
      int indx = 0;
      String paryname_indx = "";
      for (String prayerTime in prayerTimes) {
        int prayerHour = int.parse(prayerTime.split(':')[0]);
        int prayerMinute = int.parse(prayerTime.split(':')[1]);
        DateTime prayerDateTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          prayerHour,
          prayerMinute,
        );
        Duration timeDifference = prayerDateTime.difference(DateTime.now());
        if (timeDifference.isNegative) {
          timeDifference += Duration(days: 1);
        }
        if (timeDifference < smallest_times_remaind) {
          smallest_times_remaind = timeDifference;
          paryname_indx = prayname[prayerTimes.indexOf(prayerTime)];
          indx = prayerTimes.indexOf(prayerTime);
        }
      }
      yield [
        "${smallest_times_remaind.inHours.remainder(24).toString().padLeft(2, '0')}:${smallest_times_remaind.inMinutes.remainder(60).toString().padLeft(2, '0')}:${smallest_times_remaind.inSeconds.remainder(60).toString().padLeft(2, '0')}",
        paryname_indx,
        indx
      ];
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
