import 'package:get/get.dart';
import '../../data/repositories/payment_repo.dart';
import 'controllers.dart';


class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPaymentRepository>(() => PaymentRepository());
    Get.lazyPut(() => PaymentController(Get.find()));
  }
}