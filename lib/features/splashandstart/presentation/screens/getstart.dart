import 'package:flutter/material.dart';
import 'package:quran_app/features/splashandstart/presentation/widgets/splash_image.dart';

import '../../../../util/Appconstrains.dart';

class Getstart extends StatelessWidget {
  const Getstart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity, height: 120),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: splashImage(
              heigth: 200,
              width: 200,
            ),
          ),
          SizedBox(width: double.infinity, height: 55),
          Text(
            'اقرأ القرآن الكريم بطريقة صحيحة',
            style: Appconstrains.tajawal_bold.copyWith(color: Colors.black38),
          ),
          SizedBox(width: double.infinity, height: 70),
          getStartedTextWidget(
            title: 'تسجيل دخول',
            colors: [
              Appconstrains.primaryColor,
              Appconstrains.primaryColor,
              const Color.fromARGB(255, 14, 223, 195),
            ],
            textColor: Appconstrains.secondaryColor,
          ),
          SizedBox(width: double.infinity, height: 33),
          getStartedTextWidget(
            title: 'انشاء حساب',
            colors: [
              Appconstrains.secondaryColor,
              Appconstrains.secondaryColor,
            ],
            textColor: Appconstrains.primaryColor,
          )
        ],
      ),
    );
  }
}

class getStartedTextWidget extends StatelessWidget {
  final String title;
  final List<Color> colors;
  final Color textColor;
  const getStartedTextWidget(
      {super.key,
      required this.title,
      required this.colors,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        height: 50,
        width: 300,
        child: Center(
          child: Text(
            title,
            style: Appconstrains.tajawal_medium.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
