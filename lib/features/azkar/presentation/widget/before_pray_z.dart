import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart'
    show DashedCircularProgressBar;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:quran_app/features/azkar/data/collaction/data_z.dart'
    show DataZ;
import 'package:quran_app/features/azkar/presentation/widget/AzkarFinalizationWidget.dart'
    show AzkarFinalizationWidget;
import 'package:quran_app/util/widgets/ZakarItemDisplay.dart';

import '../../../../util/Appconstrains.dart' show Appconstrains;
import '../../data/model/azkarmodel.dart';

class BeforePrayZ extends StatelessWidget {
  final List<Azkarmodel> items;
  BeforePrayZ({super.key})
      : items = DataZ()
            .prayer_azkar
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
            'اذكار قبل الصلاة',
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
