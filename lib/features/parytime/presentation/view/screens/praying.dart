import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:quran_app/features/parytime/presentation/view/widges/address_name.dart';
import 'package:quran_app/util/Appconstrains.dart';

class prayerScreen extends StatelessWidget {
  const prayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              color: Appconstrains.primaryColor,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Appconstrains.secondaryColor,
                            ),
                            onPressed: () async {
                              // print(await getAddressFromLatLng());
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.kaaba,
                              color: Appconstrains.secondaryColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'مواقيت الصلاة',
                            style: Appconstrains.tajawal_bold.copyWith(
                              color: Appconstrains.secondaryColor,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          address_name(),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height * 0.1),
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        Text(
                          'باقي على الاذان',
                          style: Appconstrains.tajawal_medium.copyWith(
                            color: const Color.fromARGB(198, 255, 255, 255),
                            fontSize: 30.0,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '00:00:00',
                          style: Appconstrains.tajawal_bold.copyWith(
                            color: Appconstrains.secondaryColor,
                            fontSize: 40.0,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back_ios_new),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    'الاربعاء ,19 سبتمبر 2023',
                                    style:
                                        Appconstrains.tajawal_medium.copyWith(
                                      color: Appconstrains.secondaryColor,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    'الموافق 19 رمضان 1444',
                                    style: Appconstrains.tajawal_bold.copyWith(
                                      color: Appconstrains.secondaryColor,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                row_time_pary(
                  title: 'الفجر',
                  time: '00:00',
                  onPressed: () {},
                ),
                row_time_pary(
                  title: 'الشروق',
                  time: '00:00',
                  onPressed: () {},
                ),
                row_time_pary(
                  title: 'الظهر',
                  time: '00:00',
                  onPressed: () {},
                ),
                row_time_pary(
                  title: 'العصر',
                  time: '00:00',
                  onPressed: () {},
                ),
                row_time_pary(
                  title: 'المغرب',
                  time: '00:00',
                  onPressed: () {},
                ),
                row_time_pary(
                  title: 'العشاء',
                  time: '00:00',
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class row_time_pary extends StatelessWidget {
  const row_time_pary({
    super.key,
    required this.title,
    required this.time,
    required this.onPressed,
  });
  final String title;
  final String time;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.notifications,
                color: Appconstrains.primaryColor,
                size: 30,
              ),
            ),
            Text(
              time,
              style: Appconstrains.tajawal_bold.copyWith(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        Text(title,
            style: Appconstrains.tajawal_bold.copyWith(
              color: Colors.black,
              fontSize: 25.0,
            )),
      ],
    );
  }
}
