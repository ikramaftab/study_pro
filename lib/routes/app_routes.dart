import 'package:get/get.dart';
import '../bindings/home_binding.dart';
import '../bindings/settings_binding.dart';
import '../bindings/signup_binding.dart';
import '../screens/IGCSE_detail.dart';
import '../screens/aleve_course_detail.dart';
import '../screens/olevel_course_detail.dart';
import '../screens/settings_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/user_profile.dart';

import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../bindings/auth_binding.dart';


class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String alevelDetail = '/alevel-detail';
  static const String olevelDetail = '/olevel-detail';
  static const String igcseDetail = '/igcse-detail';
  static const String profile = '/profile';
  static const String settings = '/settings';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),

    GetPage(name: AppRoutes.login, page: () => LoginScreen(),binding: AuthBinding(),),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(name: profile, page: () => const UserProfileScreen()),
    GetPage(name: alevelDetail, page: () => ALevelCourseDetailScreen()),
    GetPage(name: olevelDetail, page: () => OlevelCourseDetailScreen()),
    GetPage(name: igcseDetail, page: () => IgcseDetailScreen()),
    GetPage(
      name: settings,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
    ),
  ];
}