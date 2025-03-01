import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quran_app/core/util/services/local_notification_services/local_notification_services.dart';
import 'package:quran_app/features/profile/presentation/view/widgets/books_tap.dart';

class profile_snn_quran extends StatefulWidget {
  const profile_snn_quran({
    super.key,
  });

  @override
  State<profile_snn_quran> createState() => _profile_snn_quranState();
}

class _profile_snn_quranState extends State<profile_snn_quran> {
  @override
  var box;
  void initState() {
    super.initState();
    box = Hive.box('appBox');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: double.infinity,
          height: 10,
        ),
        books_tap(
          title: 'سورة الكهف',
          notificatoinactive: box.get('sura_kahf', defaultValue: false),
          onChanged: (value) {
            setState(() {
              if (value == false) {
                LocalNotificationServices.cancelNotification(8);
              } else {
                LocalNotificationServices.scheduleWeeklyNotification(
                    8, 'سورة الكهف', 'قراءة سورة الكهف', 14, 0);
              }
              box.put('sura_kahf', value);
            });
          },
        ),
        books_tap(
          title: 'سورة البقرة',
          notificatoinactive: box.get('sura_baqara', defaultValue: false),
          onChanged: (value) {
            setState(() {
              if (value == false) {
                LocalNotificationServices.cancelNotification(9);
              } else {
                LocalNotificationServices.scheduleDailyNotification(
                    9, 'سورة البقرة', 'قراءة سورة البقرة', 15, 0);
              }
              box.put('sura_baqara', value);
            });
          },
        ),
        books_tap(
          title: 'سورة الملك',
          notificatoinactive: box.get('sura_molk', defaultValue: false),
          onChanged: (value) {
            setState(() {
              if (value == false) {
                LocalNotificationServices.cancelNotification(10);
              } else {
                LocalNotificationServices.scheduleDailyNotification(
                    10, 'سورة الملك', 'قراءة سورة الملك', 16, 0);
              }
              box.put('sura_molk', value);
            });
          },
        )
      ],
    );
  }
}
