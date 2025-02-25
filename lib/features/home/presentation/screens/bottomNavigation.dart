import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/features/parytime/presentation/viewmodel/address_name/address_name_cubit.dart';
import 'package:quran_app/features/profile/presentation/viewmodel/data_storage_hive/data_storage_hive_cubit.dart';
import 'package:quran_app/util/services/setupServiceLocator.dart';

import '../../../../util/Appconstrains.dart';
import '../../../azkar/presentation/screen/alzakr.dart';
import '../../../parytime/presentation/view/screens/praying.dart';
import '../../../parytime/presentation/viewmodel/parytime/parytime_cubit.dart';
import '../../../profile/presentation/view/screens/profile.dart';
import '../../../quranRead/presentation/view/screens/quranReader.dart';
import '../widgets/homescreen.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int selectedIndex = 0;
  final List<Widget> _screens = [
    mainHomeScreen(),
    alzkarWidget(),
    quranReader(),
    MultiBlocProvider(
      providers: [
        BlocProvider<AddressNameCubit>(
          create: (context) => getIt<AddressNameCubit>(),
        ),
        BlocProvider<ParytimeCubit>(
          create: (context) => getIt<ParytimeCubit>(),
        ),
      ],
      child: prayerScreen(),
    ),
    BlocProvider<DataStorageHiveCubit>(
      create: (context) => DataStorageHiveCubit(),
      child: userProfile(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 11,
      unselectedItemColor: Appconstrains.secondaryColor,
      selectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.bookOpen,
          ),
          label: 'ورد اليوم',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.handsPraying,
          ),
          label: 'الاذكار',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.kaaba,
          ),
          label: 'الاستماع',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.mosque,
          ),
          label: ' الصلاة',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'المزيد',
        ),
      ],
    );
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
