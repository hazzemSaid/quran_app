import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/util/Appconstrains.dart';
import '../../../../../core/util/route.dart';
import '../../widgets/getStartedTextWidget.dart';
import '../../widgets/splash_image.dart';

class getstartmobileViewLayout extends StatelessWidget {
  const getstartmobileViewLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: double.infinity, height: constraints.maxHeight * 0.08),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 20),
                child: splashImage(),
              ),
            ),
            SizedBox(
                width: double.infinity, height: constraints.maxHeight * 0.1),
            Expanded(
              flex: 1,
              child: Text(
                'اقرأ القرآن الكريم بطريقة صحيحة',
                style:
                    Appconstrains.tajawal_bold.copyWith(color: Colors.black38),
              ),
            ),
            SizedBox(
                width: double.infinity, height: constraints.maxHeight * 0.06),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  //in future check if user is logged in before

                  context.go(MyRoute.onbording);
                },
                child: getStartedTextWidget(
                  title: 'تسجيل دخول',
                  colors: [
                    Appconstrains.primaryColor,
                    Appconstrains.primaryColor,
                    const Color.fromARGB(255, 14, 223, 195),
                  ],
                  textColor: Appconstrains.secondaryColor,
                ),
              ),
            ),
            SizedBox(
                width: double.infinity, height: constraints.maxHeight * 0.06),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  context.go(MyRoute.onbording);
                },
                child: getStartedTextWidget(
                  title: 'انشاء حساب',
                  colors: [
                    Appconstrains.secondaryColor,
                    Appconstrains.secondaryColor,
                  ],
                  textColor: Appconstrains.primaryColor,
                ),
              ),
            ),
            SizedBox(
                width: double.infinity, height: constraints.maxHeight * 0.06),
          ],
        );
      },
    );
  }
}
