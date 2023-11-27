import 'package:get/get.dart';
import 'package:task/common/bindinng/auth_binding/login_binding.dart';
import 'package:task/common/bindinng/auth_binding/register_binding.dart';
import 'package:task/common/bindinng/services_binding.dart';
import 'package:task/common/middlewares/auth_middleware.dart';
import 'package:task/view/screens/auth/register_screen.dart';
import 'package:task/view/screens/home_screen.dart';

import '../../view/screens/auth/login_screen.dart';
import '../../view/screens/onboarding_screen.dart';
import 'pages.dart';

List<GetPage> routes = [
  GetPage(
    name: "/",
    page: () => const OnBoardingScreen(),
    binding: ServicesAppBinding(),
    middlewares: [MiddleWareAuthentication()],
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: AppRoute.register,
    page: () => const RegisterScreen(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: AppRoute.home,
    page: () => const HomeScreen(),
  ),
];
