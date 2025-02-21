import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        Container(
          height: MediaQuery.sizeOf(context).height * 0.09,
          color: Appconstrains.primaryColor,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'المزيد',
              style: Appconstrains.tajawal_bold.copyWith(
                color: Appconstrains.secondaryColor,
                fontSize: 24,
              ),
            ),
          ),
        ),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              height: 10,
            ),
            books_tap(
              title: 'سورة الكهف',
            ),
            books_tap(
              title: 'سورة البقرة',
            ),
            books_tap(
              title: 'سورة الملك',
            )
          ],
        ),
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

class alerm_azkar extends StatelessWidget {
  const alerm_azkar({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.icon,
  });
  final bool value;
  final String title;
  final void Function(bool) onChanged;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Switch.adaptive(
            value: value,
            activeColor: Appconstrains.primaryColor,
            inactiveTrackColor: Colors.grey,
            onChanged: onChanged,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: Appconstrains.tajawal_bold.copyWith(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                color: Appconstrains.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class books_tap extends StatelessWidget {
  const books_tap({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: Appconstrains.tajawal_bold.copyWith(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.book,
            color: Appconstrains.primaryColor,
          ),
        ],
      ),
    );
  }
}

class timer_widget extends StatelessWidget {
  final String title;
  final String time;
  final void Function(TimeOfDay) onTimeChanged;
  const timer_widget({
    super.key,
    required this.title,
    required this.time,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //i need to chose hour and minute
          GestureDetector(
            onTap: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((val) => onTimeChanged(val!));
            },
            child: SizedBox(
              child: Text(
                time,
                style: Appconstrains.tajawal_bold.copyWith(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                title,
                style: Appconstrains.tajawal_bold.copyWith(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              Icon(
                Icons.timelapse_rounded,
                color: Appconstrains.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
