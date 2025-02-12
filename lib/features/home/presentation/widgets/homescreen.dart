import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../util/Appconstrains.dart';

class mainHomeScreen extends StatelessWidget {
  const mainHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
        ),
        HomePageAppBar(),
        quran_content(),
        SizedBox(
          height: 50,
        ),
        two_button_content(),
        SizedBox(
          height: 26,
        ),
        Divider(
          color: Colors.black12,
          thickness: 1.4,
        ),
        SizedBox(
          height: 26,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('data'), Text("الختمة الحالية")],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('28:الورد القادم'), Text('data')],
              )
            ],
          ),
        )
      ],
    );
  }
}

class two_button_content extends StatelessWidget {
  const two_button_content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        quran_content_button(
          color_text: Colors.black,
          color_use: const Color.fromARGB(255, 239, 220, 43),
          text_content: '< اتمت القراءة',
        ),
        quran_content_button(
          color_text: Colors.white,
          text_content: "تابع قراء الورد",
          color_use: const Color.fromARGB(255, 53, 147, 57),
        ),
      ],
    );
  }
}

class quran_content_button extends StatelessWidget {
  final String text_content;
  final Color color_use;
  final Color color_text;
  const quran_content_button({
    super.key,
    required this.color_text,
    required this.color_use,
    required this.text_content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 20),
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: MediaQuery.sizeOf(context).height * 0.093,
        decoration: BoxDecoration(
          color: color_use,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Text(
              text_content,
              style: Appconstrains.tajawal_bold.copyWith(
                color: color_text,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class quran_content extends StatelessWidget {
  const quran_content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 21),
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text('data'),
        ],
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: MediaQuery.sizeOf(context).height * 0.09,
      width: double.infinity,
      color: Appconstrains.primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, color: Appconstrains.secondaryColor),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.bookmark,
                      color: Appconstrains.secondaryColor),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.health_and_safety_sharp,
                      color: Appconstrains.secondaryColor),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "الورد الحالي",
                style: Appconstrains.tajawal_medium.copyWith(
                  color: Appconstrains.secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
