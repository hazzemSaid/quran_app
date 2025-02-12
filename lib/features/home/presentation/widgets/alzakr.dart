import 'package:flutter/material.dart';

import '../../../../util/Appconstrains.dart';

class alzkarWidget extends StatelessWidget {
  const alzkarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("الاذكار",
            style: Appconstrains.tajawal_medium.copyWith(
              color: Appconstrains.primaryColor,
            )),
      ),
    );
  }
}
