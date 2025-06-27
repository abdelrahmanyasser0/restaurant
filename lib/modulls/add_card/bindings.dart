import 'package:get/get.dart';
import '../../data/repositories/payment_repo.dart';
import 'controllers.dart';


class AddPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPaymentRepository>(() => PaymentRepository());
    Get.lazyPut(() => AddPaymentController(Get.find()));
  }
}
