import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:quran_app/core/bloc/bloc.dart';
import 'package:quran_app/core/util/services/local_notification_services/local_notification_services.dart';
import 'package:quran_app/core/util/services/setupServiceLocator.dart'
    show setupServiceLocator;
import 'package:quran_app/features/parytime/data/model/praytimemodel.dart';
import 'package:quran_library/quran_library.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'core/util/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  tz.initializeTimeZones();
  QuranLibrary().init();
  await LocalNotificationServices.init();
  setupServiceLocator();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  await Hive.openBox<PrayerTimeModel>('prayerTimes'); // Open the box
  await Hive.openBox('appBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //change direction
      locale: const Locale('ar', 'SA'),
      title: 'Quran App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      routerConfig: MyRoute.router,
    );
  }
}
