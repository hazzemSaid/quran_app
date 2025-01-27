import 'package:flutter/material.dart';

import '../../../../../util/Appconstrains.dart';
import '../../widgets/getStartedTextWidget.dart';
import '../../widgets/splash_image.dart';

class getStartTabletlayout extends StatelessWidget {
  const getStartTabletlayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity, height: 120),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 20),
          child: splashImage(),
        ),
        SizedBox(width: double.infinity, height: 55),
        Text(
          'اقرأ القرآن الكريم بطريقة صحيحة',
          style: Appconstrains.tajawal_bold.copyWith(color: Colors.black38),
        ),
        SizedBox(width: double.infinity, height: 70),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getStartedTextWidget(
              title: 'تسجيل دخول',
              colors: [
                Appconstrains.primaryColor,
                Appconstrains.primaryColor,
                const Color.fromARGB(255, 14, 223, 195),
              ],
              textColor: Appconstrains.secondaryColor,
            ),
            SizedBox(width: 20),
            getStartedTextWidget(
              title: 'انشاء حساب',
              colors: [
                Appconstrains.secondaryColor,
                Appconstrains.secondaryColor,
              ],
              textColor: Appconstrains.primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
