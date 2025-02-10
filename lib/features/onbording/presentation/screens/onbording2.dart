import 'package:flutter/material.dart';
import 'package:quran_app/features/onbording/presentation/screens/onbording3.dart';

import '../../../../util/Appconstrains.dart';
import '../../../../util/constants/assets.dart';

class SecondOnbording extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appconstrains.secondaryColor,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
            ),
            Expanded(
                flex: 7,
                child: Image(
                    fit: BoxFit.contain, image: AssetImage(MyAssets.Splash))),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
              width: double.infinity,
            ),
            Expanded(
              flex: 1,
              child: Text('قم بالاستماع الي افضل قراء الفرآن الكريم',
                  style: Appconstrains.tajawal_medium.copyWith(
                    color: Colors.black38,
                    fontSize: 16,
                  )),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.002,
            ),
            Expanded(
              flex: 1,
              child: Text(
                'وقراءه الاحاديث والقراءه بالتجويد ومواقيت الصلاه',
                style: Appconstrains.tajawal_medium
                    .copyWith(color: Colors.black, fontSize: 16),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
            ),
            Expanded(
                flex: 12,
                child: Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(MyAssets.Onbording2))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                  onTap: () {
                    //in future check if user is logged in before
                    Navigator.of(context).pushReplacement(
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
                  )),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
          ],
        ));
  }
}
