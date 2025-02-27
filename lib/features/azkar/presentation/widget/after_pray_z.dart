import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart'
    show DashedCircularProgressBar;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/features/azkar/data/model/azkarmodel.dart';
import 'package:quran_app/features/azkar/presentation/widget/AzkarFinalizationWidget.dart'
    show AzkarFinalizationWidget;
import 'package:quran_app/core/util/widgets/ZakarItemDisplay.dart';

import '../../../../core/util/Appconstrains.dart' show Appconstrains;
import '../../data/collaction/data_z.dart' show DataZ;

class AfterPrayZ extends StatelessWidget {
  List<Azkarmodel> afterPrayAzkar = [];
  AfterPrayZ({super.key})
      : afterPrayAzkar = DataZ()
            .prayer_later_azkar
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
            'اذكار بعد الصلاة',
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
            child: ZakarItemDisplay(items: afterPrayAzkar),
          ),
        ],
      ),
    );
  }
}
