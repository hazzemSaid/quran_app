import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:quran_app/features/profile/presentation/view/widgets/alerm_azkar.dart';
import 'package:quran_app/features/profile/presentation/view/widgets/profile_app_bar.dart';
import 'package:quran_app/features/profile/presentation/view/widgets/profile_snn_quran.dart';
import 'package:quran_app/features/profile/presentation/view/widgets/timer_widget.dart';
import 'package:quran_app/features/profile/presentation/viewmodel/data_storage_hive/data_storage_hive_cubit.dart';
import 'package:quran_app/util/Appconstrains.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  late TimeOfDay time_morning_z;
  late TimeOfDay time_night_z;
  bool remaind_morning = false;
  bool remaind_night = false;
  late Box box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('appBox');
    context.read<DataStorageHiveCubit>().loadDataFromHive();
    time_morning_z = context.read<DataStorageHiveCubit>().time_morning_z!;
    time_night_z = context.read<DataStorageHiveCubit>().time_night_z!;
    remaind_morning = context.read<DataStorageHiveCubit>().remaind_morning;
    remaind_night = context.read<DataStorageHiveCubit>().remaind_night;
  }

  void _saveToHive() {
    context.read<DataStorageHiveCubit>().saveDataToHive(
          time_morning_z: time_morning_z,
          time_night_z: time_night_z,
          remaind_morning: remaind_morning,
          remaind_night: remaind_night,
        );
  }

  @override
  Widget build(BuildContext context) {
    // Ensure time_morning_z and time_night_z are initialized

    return Scaffold(
      body: BlocBuilder<DataStorageHiveCubit, DataStorageHiveState>(
        builder: (context, state) {
          if (state is DataStorageHiveFailure) {
            return const Center(
              child: Text('Failed to load data from Hive'),
            );
          }
          if (state is DataStorageHiveSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                profile_app_bar(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Text(
                    "سنن قرأنية",
                    style: Appconstrains.tajawal_bold.copyWith(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                  ),
                ),
                profile_snn_quran(),
                const Divider(height: 40, color: Colors.black, thickness: 0.5),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Text(
                    'منبهات الاذكار',
                    style: Appconstrains.tajawal_bold.copyWith(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 10),
                    alerm_azkar(
                      title: 'الاذكار الصباح',
                      value: remaind_morning,
                      onChanged: (value) {
                        setState(() {
                          remaind_morning = value;
                          _saveToHive();
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
                          // Save data
                          _saveToHive();
                        });
                      },
                    ),
                    alerm_azkar(
                      title: 'الاذكار المساء',
                      value: remaind_night,
                      onChanged: (value) {
                        setState(() {
                          remaind_night = value;
                          _saveToHive();
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
                          // Save data
                          _saveToHive();
                        });
                      },
                    ),
                  ],
                ),
                const Divider(height: 40, color: Colors.black, thickness: 0.5),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: GestureDetector(
                    onTap: () {
                      // Handle support logic
                    },
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
                        const SizedBox(width: 10),
                        const Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Color(0xffFF0000),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 40, color: Colors.black, thickness: 0.5),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: GestureDetector(
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
                        const SizedBox(width: 10),
                        const Icon(
                          FontAwesomeIcons.whatsapp,
                          color: Color(0xff25D366),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
