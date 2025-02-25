import 'package:flutter/material.dart';
import 'package:quran_app/features/azkar/data/collaction/data_z.dart'
    show DataZ;
import 'package:quran_app/features/azkar/data/model/azkarmodel.dart';
import 'package:quran_app/util/Appconstrains.dart' show Appconstrains;

import '../../../../util/widgets/ZakarItemDisplay.dart';

class wakeupAzkarPage extends StatelessWidget {
  final List<Azkarmodel> items;
  wakeupAzkarPage({super.key})
      : items = DataZ()
            .weak_up_z
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
            'اذكار الاستيقاظ',
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
