import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/core/util/Appconstrains.dart';
import 'package:quran_app/core/util/constants/assets.dart';
import 'package:quran_app/core/util/services/local_notification_services/local_notification_services.dart';
import 'package:quran_app/features/QiblaDirection/presentation/view/screens/QiblaDirection.dart';
import 'package:quran_app/features/parytime/data/model/praytimemodel.dart';
import 'package:quran_app/features/parytime/presentation/view/funcitons/streaming_parytime.dart';
import 'package:quran_app/features/parytime/presentation/view/widges/address_name.dart';
import 'package:quran_app/features/parytime/presentation/view/widges/time_remaind_withstream.dart';
import 'package:quran_app/features/parytime/presentation/viewmodel/parytime/parytime_cubit.dart';

class PrayerScreen extends StatelessWidget {
  PrayerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ParytimeCubit, ParytimeState>(
        builder: (context, state) {
          if (state is ParytimeError) {
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      state.message,
                      style: Appconstrains.tajawal_medium.copyWith(
                        color: Appconstrains.primaryColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          context.read<ParytimeCubit>().getParytime();
                        },
                        icon: (const Icon(Icons.refresh)))),
              ],
            );
          }
          if (state is ParytimeLoaded) {
            return Column(
              children: [
                Expanded(
                  child: StreamBuilder<List>(
                      stream:
                          StreamingParyTime.func(times: state.praytimemodel),
                      initialData: ["", "", 0],
                      builder: (context, snapshot) {
                        List<String> images = [
                          MyAssets.fajr,
                          MyAssets.fajr,
                          MyAssets.dhuhr,
                          MyAssets.asr,
                          MyAssets.maghrib,
                          MyAssets.isha,
                        ];
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              images[snapshot.data![2]],
                            ),
                            fit: BoxFit.cover,
                          )),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const PrayerHeader(),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08),
                                const Text(
                                  'باقي على الاذان',
                                  style: TextStyle(
                                      color: Color(0xC6FFFFFF), fontSize: 30),
                                ),
                                const SizedBox(height: 8),
                                time_remaind(
                                  time_f: snapshot.data![1] ?? '',
                                  time_s: snapshot.data![0] ?? '',
                                ),
                                const SizedBox(height: 30),
                                PrayerDateSection(
                                    prayTimeModel: state.praytimemodel),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                PrayerTimingList(
                  times: state.praytimemodel,
                ),
              ],
            );
          }
          return Center(
            child: Lottie.asset(
              MyAssets.end_azkar_animation_file,
              frameRate: FrameRate(60),
              repeat: false,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
            ),
          );
        },
      ),
    );
  }
}

/// **Header Section (Settings & Title)**
class PrayerHeader extends StatelessWidget {
  const PrayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.settings,
                    color: Appconstrains.secondaryColor),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.kaaba,
                    color: Appconstrains.secondaryColor),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QiblaCompass()));
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8.0),
              Text(
                'مواقيت الصلاة',
                style: Appconstrains.tajawal_bold.copyWith(
                  color: Appconstrains.secondaryColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 15.0),
              const address_name(),
            ],
          ),
        ],
      ),
    );
  }
}

/// **Prayer Time & Date Section**
class PrayerDateSection extends StatelessWidget {
  final PrayerTimeModel prayTimeModel;
  const PrayerDateSection({super.key, required this.prayTimeModel});

  @override
  Widget build(BuildContext context) {
    final hijriDate = prayTimeModel.data.date.hijri;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              prayTimeModel.data.date.readable.toString(),
              style: Appconstrains.tajawal_medium.copyWith(
                color: Appconstrains.secondaryColor,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${hijriDate.weekday.ar} , ${hijriDate.day} ${hijriDate.month.ar} ${hijriDate.year}',
              style: Appconstrains.tajawal_bold.copyWith(
                color: Appconstrains.secondaryColor,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// **Prayer Timings List**
class PrayerTimingList extends StatefulWidget {
  final PrayerTimeModel times;
  const PrayerTimingList({super.key, required this.times});

  @override
  State<PrayerTimingList> createState() => _PrayerTimingListState();
}

class _PrayerTimingListState extends State<PrayerTimingList> {
  @override
  Widget build(BuildContext context) {
    final prayerTimes = {
      'الفجر': widget.times.data.timings.fajr,
      'الشروق': widget.times.data.timings.sunrise,
      'الظهر': widget.times.data.timings.dhuhr,
      'العصر': widget.times.data.timings.asr,
      'المغرب': widget.times.data.timings.maghrib,
      'العشاء': widget.times.data.timings.isha,
    };

    return Expanded(
      child: Container(
        decoration: BoxDecoration(),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: prayerTimes.length,
          itemBuilder: (context, index) {
            final title = prayerTimes.keys.elementAt(index);
            final time = prayerTimes.values.elementAt(index);
            var box = Hive.box('appBox');
            bool isNotificationEnabled = box.get(title) ?? false;
            return PrayerTimeRow(
              title: title,
              time: time,
              isNotificationEnabled: isNotificationEnabled,
              onNotificationPressed: () {
                setState(() {
                  if (isNotificationEnabled) {
                    LocalNotificationServices.cancelNotification(index);
                  } else {
                    LocalNotificationServices.scheduleDailyNotification(
                            index,
                            title,
                            'Your prayer time is near',
                            int.parse(time.split(':')[0]),
                            int.parse(time.split(':')[1]))
                        .then((value) {
                      print('Notification Scheduled + $title,');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('تم تفعيل الاشعار لصلاة $title'),
                      ));
                    });
                  }
                  isNotificationEnabled = !isNotificationEnabled;
                  box.put(title, isNotificationEnabled);
                });
              },
            );
          },
        ),
      ),
    );
  }
}

/// **Single Row for Prayer Time**
class PrayerTimeRow extends StatelessWidget {
  final String title;
  final String time;
  final bool isNotificationEnabled;
  final void Function()? onNotificationPressed;
  const PrayerTimeRow({
    super.key,
    required this.title,
    required this.time,
    this.isNotificationEnabled = false,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onNotificationPressed,
                icon: Icon(
                    isNotificationEnabled
                        ? Icons.notifications_active
                        : Icons.notifications_off,
                    color: isNotificationEnabled
                        ? Appconstrains.primaryColor
                        : Colors.grey,
                    size: 30),
              ),
              Text(time,
                  style: Appconstrains.tajawal_bold.copyWith(fontSize: 20.0)),
            ],
          ),
          Text(title,
              style: Appconstrains.tajawal_bold.copyWith(fontSize: 25.0)),
        ],
      ),
    );
  }
}
