import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/features/azkar/data/collaction/data_z.dart';
import 'package:quran_app/features/azkar/data/model/azkarmodel.dart';
import 'package:quran_app/util/Appconstrains.dart';
import 'package:quran_app/util/widgets/ZakarItemDisplay.dart';

import 'AzkarFinalizationWidget.dart';

class AzkarMorningPage extends StatelessWidget {
  final List<Azkarmodel> items;

  AzkarMorningPage({super.key})
      : items = DataZ()
            .morning_data
            .map<Azkarmodel>(
                (e) => Azkarmodel.fromJson(e as Map<String, dynamic>))
            .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appconstrains.primaryColor,
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            'اذكار الصباح',
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
