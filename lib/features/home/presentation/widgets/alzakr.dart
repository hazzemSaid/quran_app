import 'package:flutter/material.dart';
import 'package:quran_app/features/azkar/presentation/screen/after_pray_z.dart';
import 'package:quran_app/features/azkar/presentation/screen/before_pray_z.dart';
import 'package:quran_app/features/azkar/presentation/screen/morning_z.dart';
import 'package:quran_app/features/azkar/presentation/screen/night_z.dart';
import 'package:quran_app/features/azkar/presentation/screen/sleep_z.dart';
import 'package:quran_app/features/azkar/presentation/screen/wakeup_z.dart';
import 'package:quran_app/util/constants/assets.dart';

import '../../../../util/Appconstrains.dart';

class alzkarWidget extends StatelessWidget {
  const alzkarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appconstrains.secondaryColor,
        appBar: AppBar(
          title: Text(
            "الاذكار",
            style: Appconstrains.tajawal_medium.copyWith(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Appconstrains.primaryColor,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Expanded(
                child: azkar_widget(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AzkarMorningPage()));
                  },
                  factoroftitle: 2,
                  factorofwidth: 0.9,
                  colorList: [
                    const Color.fromARGB(255, 226, 209, 195),
                    const Color.fromARGB(255, 226, 209, 195),
                    const Color.fromARGB(255, 226, 209, 195),
                  ],
                  title: "اذكار الصباح",
                  image: MyAssets.sun,
                ),
              ),
              SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Expanded(
                child: azkar_widget(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AzkarNightPage()));
                  },
                  factoroftitle: 2,
                  factorofwidth: 0.9,
                  colorList: [
                    const Color.fromARGB(255, 167, 166, 203),
                    const Color.fromARGB(255, 137, 137, 186),
                  ],
                  title: "اذكار المساء",
                  image: MyAssets.moon,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: azkar_widget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AfterPrayZ()));
                        },
                        factoroftitle: 1,
                        factorofwidth: 0.4,
                        colorList: [
                          //  background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
                          const Color.fromARGB(255, 40, 113, 155),
                          const Color.fromARGB(255, 128, 208, 199),
                        ],
                        title: 'بعد الصلاة',
                        image: MyAssets.shalat,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: azkar_widget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BeforePrayZ()));
                        },
                        factorofwidth: 0.4,
                        factoroftitle: 1,
                        colorList: [
                          const Color.fromARGB(255, 168, 237, 234),
                          const Color.fromARGB(255, 254, 214, 227),
                        ],
                        title: 'قبل الصلاة',
                        image: MyAssets.openhand,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: azkar_widget(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => wakeupAzkarPage())),
                        factoroftitle: 1,
                        factorofwidth: 0.4,
                        colorList: [
                          // background-image: linear-gradient(to right, #f83600 0%, #f9d423 100%);
                          const Color.fromARGB(255, 240, 139, 112),
                          const Color.fromARGB(255, 249, 212, 35),
                          const Color.fromARGB(255, 249, 212, 35),
                        ],
                        title: 'الاستيقاظ',
                        image: MyAssets.weakup,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: azkar_widget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SleepAzkarPage()));
                        },
                        factorofwidth: 0.4,
                        factoroftitle: 1,
                        colorList: [
                          // background-image: linear-gradient(to top, #09203f 0%, #537895 100%);
                          const Color.fromARGB(255, 9, 32, 63),
                          const Color.fromARGB(255, 83, 120, 149),
                          const Color.fromARGB(255, 83, 120, 149),
                          const Color.fromARGB(255, 83, 120, 149),
                        ],
                        title: 'النوم',
                        image: MyAssets.sleep,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class azkar_widget extends StatelessWidget {
  const azkar_widget({
    super.key,
    required this.colorList,
    required this.title,
    required this.image,
    required this.factorofwidth,
    required this.factoroftitle,
    required this.onTap,
  });
  final List<Color> colorList;
  final String title;
  final String image;
  final double factorofwidth;
  final double factoroftitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.sizeOf(context).height * 0.12,
        width: MediaQuery.sizeOf(context).width * factorofwidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorList,
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              fit: BoxFit.fitHeight,
              height: MediaQuery.sizeOf(context).height * 0.05 * factoroftitle,
              image: AssetImage(
                // MyAssets.sun,
                image,
              ),
            ),
            Text(
              title,
              style: Appconstrains.tajawal_medium.copyWith(
                color: Colors.black,
                fontSize: 20 * factoroftitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
