import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/features/parytime/data/model/praytimemodel.dart';
import 'package:quran_app/features/parytime/presentation/view/funcitons/streaming_parytime.dart';
import 'package:quran_app/features/parytime/presentation/view/widges/address_name.dart';
import 'package:quran_app/features/parytime/presentation/view/widges/time_remaind_withstream.dart';
import 'package:quran_app/features/parytime/presentation/viewmodel/parytime/parytime_cubit.dart';
import 'package:quran_app/util/Appconstrains.dart';
import 'package:quran_app/util/constants/assets.dart';

class PrayerScreen extends StatelessWidget {
  PrayerScreen({super.key});
  int indx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ParytimeCubit, ParytimeState>(
        builder: (context, state) {
          if (state is ParytimeError) {
            return Center(child: Text(state.message));
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
                        indx = snapshot.data![2];
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
                                        0.1),
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
                  indx: indx,
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
                onPressed: () {},
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
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
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
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}

/// **Prayer Timings List**
class PrayerTimingList extends StatelessWidget {
  final PrayerTimeModel times;
  final int indx;
  const PrayerTimingList({super.key, required this.indx, required this.times});

  @override
  Widget build(BuildContext context) {
    final prayerTimes = {
      'الفجر': times.data.timings.fajr,
      'الشروق': times.data.timings.sunrise,
      'الظهر': times.data.timings.dhuhr,
      'العصر': times.data.timings.asr,
      'المغرب': times.data.timings.maghrib,
      'العشاء': times.data.timings.isha,
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
            return PrayerTimeRow(
              isactive: indx == index,
              title: title,
              time: time,
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
  final bool isactive;
  const PrayerTimeRow(
      {super.key,
      required this.title,
      required this.time,
      required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isactive
            ? const Color.fromARGB(255, 221, 185, 56)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.01,
        horizontal: MediaQuery.sizeOf(context).height * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications,
                    color: Appconstrains.primaryColor, size: 30),
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
