import 'package:get/get.dart';
import 'package:learning/app/modules/Authentication/views/signin_page_view.dart';

import '../modules/Authentication/bindings/authentication_binding.dart';
import '../modules/Authentication/views/authentication_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninPageView(),
      binding: AuthenticationBinding(),
    ),
  ];
}
