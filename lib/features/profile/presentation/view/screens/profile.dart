import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/features/profile/presentation/view/widgets/alerm_azkar.dart';
import 'package:quran_app/features/profile/presentation/view/widgets/profile_app_bar.dart';
import 'package:quran_app/features/profile/presentation/view/widgets/profile_snn_quran.dart';
import 'package:quran_app/features/profile/presentation/view/widgets/timer_widget.dart';
import 'package:quran_app/util/Appconstrains.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  TimeOfDay? time_morning_z = TimeOfDay.now();
  TimeOfDay? time_night_z = TimeOfDay.now();
  bool remaind_morning = false;
  bool remaind_night = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        profile_app_bar(),
        SizedBox(
          height: 20,
          width: double.infinity,
        ),
        Text(
          "سنن قرأنية",
          style: Appconstrains.tajawal_bold.copyWith(
            color: Colors.black54,
            fontSize: 20,
          ),
        ),
        profile_snn_quran(),
        Divider(
          height: 40,
          color: Colors.black,
          thickness: 0.5,
        ),
        Text(
          'منبهات الاذكار',
          style: Appconstrains.tajawal_bold.copyWith(
            color: Colors.black54,
            fontSize: 20,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              height: 10,
            ),
            alerm_azkar(
              title: 'الاذكار الصباح',
              value: remaind_morning,
              onChanged: (value) {
                setState(() {
                  remaind_morning = value;
                });
              },
              icon: FontAwesomeIcons.sun,
            ),
            timer_widget(
                title: "وقت اذكار الصباح",
                time: time_morning_z!.format(context),
                onTimeChanged: (val) {
                  setState(() {
                    time_morning_z = val;
                  });
                }),
            alerm_azkar(
              title: 'الاذكار المساء',
              value: remaind_night,
              onChanged: (value) {
                setState(() {
                  remaind_night = value;
                });
              },
              icon: FontAwesomeIcons.moon,
            ),
            timer_widget(
                title: "وقت اذكار المساء",
                time: time_night_z!.format(context),
                onTimeChanged: (val) {
                  setState(() {
                    time_night_z = val;
                  });
                }),
          ],
        ),
        Divider(
          height: 40,
          color: Colors.black,
          thickness: 0.5,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'قم بدعم التطبيق ',
                style: Appconstrains.tajawal_bold.copyWith(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                FontAwesomeIcons.solidHeart,
                color: Color(0xffFF0000),
              ),
            ],
          ),
        ),
        Divider(
          height: 40,
          color: Colors.black,
          thickness: 0.5,
        ),
        GestureDetector(
          onTap: () {
            // Handle contact us logic
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'تواصل معنا ',
                style: Appconstrains.tajawal_bold.copyWith(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                FontAwesomeIcons.whatsapp,
                color: Color(0xff25D366),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
