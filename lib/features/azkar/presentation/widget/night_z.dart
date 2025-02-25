import 'package:flutter/material.dart';

import '../../../../util/Appconstrains.dart' show Appconstrains;
import '../../../../util/widgets/ZakarItemDisplay.dart';
import '../../data/collaction/data_z.dart' show DataZ;
import '../../data/model/azkarmodel.dart' show Azkarmodel;

class AzkarNightPage extends StatelessWidget {
  final List<Azkarmodel> items;

  AzkarNightPage({super.key})
      : items = DataZ()
            .night_data
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
            'اذكار المساء',
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
