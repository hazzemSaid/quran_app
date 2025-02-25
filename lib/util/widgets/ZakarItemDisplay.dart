import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:quran_app/util/Appconstrains.dart' show Appconstrains;

import '../../features/azkar/data/model/azkarmodel.dart';
import '../../features/azkar/presentation/widget/AzkarFinalizationWidget.dart'
    show AzkarFinalizationWidget;
import 'AzkarProgressTracker.dart';

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
