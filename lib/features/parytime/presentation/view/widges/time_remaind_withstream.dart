import 'package:flutter/material.dart';
import 'package:quran_app/features/parytime/data/model/praytimemodel.dart';
import 'package:quran_app/util/Appconstrains.dart';

class time_remaind extends StatelessWidget {
  const time_remaind({
    super.key,
    required this.times,
  });
  final PrayerTimeModel times;
  Stream<List> func() async* {
    while (true) {
      Duration smallest_times_remaind = Duration(days: 1);
      List<String> prayerTimes = [
        times.data.timings.fajr,
        times.data.timings.dhuhr,
        times.data.timings.asr,
        times.data.timings.maghrib,
        times.data.timings.isha,
        times.data.timings.sunrise,
      ];
      List<String> prayname = [
        'الفجر',
        'الظهر',
        'العصر',
        'المغرب',
        'العشاء',
        'الشروق',
      ];
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
        }
      }
      yield [
        "${smallest_times_remaind.inHours.remainder(24).toString().padLeft(2, '0')}:${smallest_times_remaind.inMinutes.remainder(60).toString().padLeft(2, '0')}:${smallest_times_remaind.inSeconds.remainder(60).toString().padLeft(2, '0')}",
        paryname_indx
      ];
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: func(),
        builder: (context, snapshot) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      (snapshot.data as List?)?[1] ?? '',
                      style: Appconstrains.tajawal_medium.copyWith(
                        color: Appconstrains.secondaryColor,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      (snapshot.data as List?)?[0] ?? '',
                      style: Appconstrains.tajawal_medium.copyWith(
                        color: Appconstrains.secondaryColor,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
