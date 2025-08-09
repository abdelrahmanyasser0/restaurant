import 'package:get/get.dart';
import '../../data/repositories/menu_repo.dart';



class ProfileController extends GetxController {
  final IMenuRepository repo;

  ProfileController(this.repo);

  // Text Controllers
  final userName = 'Ahmed Magdy'.obs;
  final userPhone = '012-000-00-663'.obs;
  final userEmail = 'ahmed@paradigmegypt.com'.obs;


  final marketingComm = false.obs;
  final appComm = true.obs;
  final bottomIndex = 3.obs; // Profile selected

  void toggleMarketing(bool v) => marketingComm.value = v;
  void toggleAppComm(bool v) => appComm.value = v;


  void openSection(String route) {
    if (Get.currentRoute == route) return;

  }
}

