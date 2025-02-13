import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/features/azkar/presentation/data/collaction/data_z.dart';
import 'package:quran_app/features/azkar/presentation/data/model/azkarmodel.dart';
import 'package:quran_app/util/Appconstrains.dart';

class AzkarMorningPage extends StatelessWidget {
  AzkarMorningPage({super.key});
  List<Azkarmodel> items =
      DataZ().data.map((e) => Azkarmodel.fromJson(e)).toList();

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
              )),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.red,
              child: Text("sadasd"),
            ),
            Expanded(child: zakarItemDisplay(items: items))
          ],
        ));
  }
}

class zakarItemDisplay extends StatefulWidget {
  zakarItemDisplay({
    super.key,
    required this.items,
  });

  final List<Azkarmodel> items;
  int indx = 0;

  @override
  State<zakarItemDisplay> createState() => _zakarItemDisplayState();
}

class _zakarItemDisplayState extends State<zakarItemDisplay> {
  late ValueNotifier<double>? progress;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progress = ValueNotifier<double>(0);
    progress?.addListener(() {
      print(progress?.value);
      if (progress?.value == widget.items[widget.indx].count * 1.0) {
        widget.indx++;
        progress?.value = 0;
        if (widget.indx == widget.items.length) {
          widget.indx = 0;
          // navigration to success page to finish the azkar
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          progress?.value = (progress!.value + 1);
        });
      },
      child: Container(
        color: Colors.deepPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  textAlign: TextAlign.right,
                  widget.items[widget.indx].text,
                  style: Appconstrains.cairo_bold.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.share,
                        color: Colors.white,
                      )),
                  DashedCircularProgressBar.square(
                    dimensions: 150,
                    progress: progress!.value,
                    valueNotifier: progress,
                    maxProgress: widget.items[widget.indx].count * 1.0,
                    foregroundColor: Colors.green,
                    backgroundColor: const Color(0xffeeeeee),
                    foregroundStrokeWidth: 7,
                    backgroundStrokeWidth: 7,
                    foregroundGapSize: 5,
                    foregroundDashSize: 55,
                    backgroundGapSize: 5,
                    backgroundDashSize: 55,
                    animation: true,
                    animationDuration: Duration(milliseconds: 0),
                    child: Center(
                      child: Text(
                        "${progress!.value.toInt()}",
                        style: Appconstrains.cairo_bold.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("مرة",
                          style: Appconstrains.cairo_bold.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      Text(
                        "${widget.items[widget.indx].count}",
                        style: Appconstrains.cairo_bold.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
