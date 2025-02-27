import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:quran_app/core/bloc/bloc.dart';
import 'package:quran_app/core/util/services/setupServiceLocator.dart'
    show setupServiceLocator;
import 'package:quran_library/quran_library.dart';

import 'core/util/route.dart';

void main() async {
  MyBlocObserver();
  setupServiceLocator();
  QuranLibrary().init();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
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
