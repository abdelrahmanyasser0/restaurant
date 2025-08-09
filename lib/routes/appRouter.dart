import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:payment/core/constants/app_routers.dart';

import '../modulls/menu/bindings.dart';
import '../modulls/menu/views.dart';
import '../modulls/profile/bindings.dart';
import '../modulls/profile/views.dart';


class RouterManager {
  static const String menu = AppRouter.menu;
  static const String profile =AppRouter.profile;

  static final routes = [
    GetPage(
      name: menu,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: profile,
      page: () => Profile(),
      binding: ProfileBinding(),

    ),
  ];
}
