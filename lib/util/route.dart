import 'package:go_router/go_router.dart';
import 'package:quran_app/features/splashandstart/presentation/screens/SplashPage.dart';

import '../features/auth/presentation/view/screens/layouts/mobile/screens/mobilelogin.dart';
import '../features/auth/presentation/view/screens/layouts/mobile/screens/mobileregister.dart';
import '../features/home/presentation/screens/bottomNavigation.dart';
import '../features/onbording/presentation/screens/onbording1.dart';
import '../features/splashandstart/presentation/screens/getstart.dart';

class MyRoute {
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String splash = '/splash';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String resetPassword = '/resetPassword';
  static const String verifyEmail = '/verifyEmail';
  static const String verifyPhone = '/verifyPhone';
  static const String getstart = '/getstart';
  static const String onbording = '/onbording';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: onbording, builder: (context, state) => FirstOnbording()),
    GoRoute(
      path: '/',
      builder: (context, state) => Splashpage(),
    ),
    GoRoute(
      path: getstart,
      builder: (context, state) => Getstart(),
    ),
    GoRoute(
      path: register,
      builder: (context, state) => MobileRegistration(),
    ),
    GoRoute(path: login, builder: (context, state) => MobileLoginView()),
    GoRoute(path: home, builder: (context, state) => bottomNavigation()),
  ]);

  //using if condition to naviagtion
}
