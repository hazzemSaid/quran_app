import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../util/Appconstrains.dart';

class homescreen extends StatelessWidget {
  const homescreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: double.infinity,
        ),
        Container(
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
                      icon: Icon(Icons.share,
                          color: Appconstrains.secondaryColor),
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
        ),
        SizedBox(
          width: double.infinity,
        )
      ],
    );
  }
}
