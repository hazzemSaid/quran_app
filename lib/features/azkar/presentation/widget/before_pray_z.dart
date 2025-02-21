import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart'
    show DashedCircularProgressBar;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:quran_app/features/azkar/data/collaction/data_z.dart'
    show DataZ;
import 'package:quran_app/features/azkar/presentation/widget/AzkarFinalizationWidget.dart'
    show AzkarFinalizationWidget;

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

class AzkarProgressTracker extends StatelessWidget {
  const AzkarProgressTracker({
    super.key,
    required this.indx,
    required this.maxsteps,
  });

  final int maxsteps;
  final int indx;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: indx / maxsteps,
      backgroundColor: Colors.grey,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    );
  }
}

class ZakarItemDisplay extends StatefulWidget {
  final List<Azkarmodel> items;

  ZakarItemDisplay({super.key, required this.items});

  @override
  State<ZakarItemDisplay> createState() => _ZakarItemDisplayState();
}

class _ZakarItemDisplayState extends State<ZakarItemDisplay> {
  late ValueNotifier<double> progress;
  int indx = 0;

  @override
  void initState() {
    super.initState();
    progress = ValueNotifier<double>(0);
    progress.addListener(() {
      if (progress.value == widget.items[indx].count * 1.0) {
        setState(() {
          indx++;
          progress.value = 0;
          if (indx == widget.items.length) {
            indx = 0;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AzkarFinalizationWidget(),
                ),
              );
            });
          }
        });
      }
    });
  }

  @override
  void dispose() {
    progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        progress.value += 1;
      },
      child: Column(
        children: [
          AzkarProgressTracker(
            indx: indx,
            maxsteps: widget.items.length,
          ),
          Expanded(
            flex: 200,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      top: 10,
                    ),
                    child: Text(
                      widget.items[indx].text,
                      textAlign: TextAlign.right,
                      style: Appconstrains.cairo_bold.copyWith(
                        fontSize: 20,
                        color: Color(0xffeeeeee),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle share logic
                        },
                        icon: Icon(
                          FontAwesomeIcons.share,
                          color: Colors.white,
                        ),
                      ),
                      ValueListenableBuilder<double>(
                        valueListenable: progress,
                        builder: (context, value, child) {
                          return DashedCircularProgressBar.square(
                            dimensions: 90,
                            progress: value,
                            valueNotifier: progress,
                            maxProgress: widget.items[indx].count * 1.0,
                            foregroundColor: Colors.green,
                            backgroundColor: const Color(0xffeeeeee),
                            foregroundStrokeWidth: 7,
                            backgroundStrokeWidth: 7,
                            foregroundGapSize: 5,
                            foregroundDashSize: 55,
                            backgroundGapSize: 5,
                            backgroundDashSize: 55,
                            animation:
                                false, // Disable animation for performance
                            child: Center(
                              child: Text(
                                "${value.toInt()}",
                                style: Appconstrains.cairo_bold.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "مرة",
                            style: Appconstrains.cairo_bold.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${widget.items[indx].count}",
                            style: Appconstrains.cairo_bold.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
