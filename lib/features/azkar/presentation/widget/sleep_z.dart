import 'package:flutter/material.dart';
import 'package:quran_app/features/azkar/data/collaction/data_z.dart';
import 'package:quran_app/features/azkar/data/model/azkarmodel.dart';
import 'package:quran_app/util/widgets/ZakarItemDisplay.dart';

import '../../../../util/Appconstrains.dart';

class SleepAzkarPage extends StatelessWidget {
  final List<Azkarmodel> items;
  SleepAzkarPage({super.key})
      : items = DataZ()
            .sleep_z
            .map<Azkarmodel>((e) => Azkarmodel.fromJson(e))
            .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appconstrains.primaryColor,
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            'اذكار النوم',
            style: Appconstrains.cairo_bold.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: ZakarItemDisplay(items: items),
          ),
        ],
      ),
    );
  }
}
