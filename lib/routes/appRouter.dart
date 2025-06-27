
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:payment/core/constants/app_routers.dart';
import 'package:payment/modulls/add_card/bindings.dart';

import '../modulls/add_card/views.dart';
import '../modulls/profile/bindings.dart';
import '../modulls/profile/views.dart';

class RouterManager {
  static const String profile = AppRouter.profile;
  static const String addPayment =AppRouter.addPayment;

  static final routes = [
    GetPage(
      name: profile,
      page: () => ProfileView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: addPayment,
      page: () => AddPayment(),
      binding: AddPaymentBinding(),

    ),
  ];
}
