import 'package:get/get.dart';
import '../../data/repositories/menu_repo.dart';
import 'controllers.dart';


class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IMenuRepository>(() => MenuRepository());
    Get.lazyPut(() => MenuViewController(Get.find()));
  }
}