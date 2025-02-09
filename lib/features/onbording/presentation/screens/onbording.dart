import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/util/Appconstrains.dart';
import 'package:quran_app/util/constants/assets.dart';

import '../../../../util/route.dart';

class FirstOnbording extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appconstrains.secondaryColor,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Image(width: 200, image: AssetImage(MyAssets.Splash)),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: double.infinity,
            ),
            Text('هنا ستجد كل ما يحتاجه المسلم في حياته اليوميه',
                style: Appconstrains.tajawal_medium.copyWith(
                  color: Colors.black38,
                  fontSize: 16,
                )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Text(
              'وقراءه الاحاديث والقراءه بالتجويد ومواقيت الصلاه',
              style: Appconstrains.tajawal_medium
                  .copyWith(color: Colors.black, fontSize: 16),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Image.asset(MyAssets.Onbording1),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            GestureDetector(
                onTap: () {
                  //in future check if user is logged in before
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SecondOnbording(),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.8,
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
                      colors: [
                        Appconstrains.primaryColor,
                        Appconstrains.primaryColor,
                        Appconstrains.primaryColor,
                        const Color.fromARGB(255, 14, 223, 195)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'التالي',
                      style: Appconstrains.tajawal_medium.copyWith(
                        color: const Color.fromARGB(255, 235, 235, 235),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}

class SecondOnbording extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appconstrains.secondaryColor,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Image(width: 200, image: AssetImage(MyAssets.Splash)),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: double.infinity,
            ),
            Text('قم بالاستماع الي افضل قراء الفرآن الكريم',
                style: Appconstrains.tajawal_medium.copyWith(
                  color: Colors.black38,
                  fontSize: 16,
                )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Text(
              'وقراءه الاحاديث والقراءه بالتجويد ومواقيت الصلاه',
              style: Appconstrains.tajawal_medium
                  .copyWith(color: Colors.black, fontSize: 16),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Image.asset(MyAssets.Onbording1),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            GestureDetector(
                onTap: () {
                  //in future check if user is logged in before
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ThirdOnbording(),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.8,
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
                      colors: [
                        Appconstrains.primaryColor,
                        Appconstrains.primaryColor,
                        Appconstrains.primaryColor,
                        const Color.fromARGB(255, 14, 223, 195)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'التالي',
                      style: Appconstrains.tajawal_medium.copyWith(
                        color: const Color.fromARGB(255, 235, 235, 235),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}

class ThirdOnbording extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appconstrains.secondaryColor,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Image(width: 200, image: AssetImage(MyAssets.Splash)),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: double.infinity,
            ),
            Text('هنا ستجد كل ما يحتاجه المسلم في حياته اليوميه',
                style: Appconstrains.tajawal_medium.copyWith(
                  color: Colors.black38,
                  fontSize: 16,
                )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Text(
              'استمتع بالكثير من المميزات الإسلاميه',
              style: Appconstrains.tajawal_medium
                  .copyWith(color: Colors.black, fontSize: 16),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Image.asset(MyAssets.Onbording3),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            GestureDetector(
                onTap: () {
                  context.go(MyRoute.home);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.8,
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
                      colors: [
                        Appconstrains.primaryColor,
                        Appconstrains.primaryColor,
                        Appconstrains.primaryColor,
                        const Color.fromARGB(255, 14, 223, 195)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'التالي',
                      style: Appconstrains.tajawal_medium.copyWith(
                        color: const Color.fromARGB(255, 235, 235, 235),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
