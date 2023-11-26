import 'package:get/get.dart';
import 'package:task/view/screens/auth/register_screen.dart';

import '../../view/screens/auth/login_screen.dart';
import '../../view/screens/onboarding_screen.dart';
import 'pages.dart';

List<GetPage> routes = [

  GetPage(
    name: "/",
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoute.register,
    page: () => const RegisterScreen(),
  ),
  
];
