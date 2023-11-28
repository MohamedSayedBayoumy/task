import 'package:get/get.dart';
import 'package:task/common/bindinng/auth_binding/login_binding.dart';
import 'package:task/common/bindinng/auth_binding/register_binding.dart';
import 'package:task/common/bindinng/change_password.dart';
import 'package:task/common/bindinng/services_binding.dart';
import 'package:task/common/bindinng/update_information.dart';
import 'package:task/view/screens/auth/register_screen.dart';
import 'package:task/view/screens/home_screen.dart';
import 'package:task/view/screens/onboarding_screen.dart';
import 'package:task/view/screens/updata_information_screen.dart';

import '../../view/screens/auth/login_screen.dart';
import '../../view/screens/change_password.dart';
import '../bindinng/home_screen_binding.dart';
import '../middlewares/auth_middleware.dart';
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
    binding: HomeBinding(),
  ),
  GetPage(
    name: AppRoute.update,
    page: () => const UpDateInformationScreen(),
    binding: UpDateInformationBinding(),
  ),

  GetPage(
    name: AppRoute.changePassword,
    page: () => const ChangePasswordScreen(),
    binding: ChangePasswordBinding(),
  ),
];
