import 'package:get/get.dart';
import 'package:payment/core/constants/app_routers.dart';

import '../../data/models/categories_model.dart';
import '../../data/repositories/menu_repo.dart';
import '../profile/controllers.dart';

class MenuViewController extends GetxController {
  final IMenuRepository repo;

  MenuViewController(this.repo);
  var products = <ProductsModel>[].obs;
  ProductsModel? selectedCategories;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  final bottomIndex = 1.obs;
  void changeTab(int i) {
    bottomIndex.value = i;
    switch (i) {
      case 0:
        bottomIndex.value=i;
        !Get.isRegistered<ProfileController>();
        Get.put(ProfileController(Get.find()));

        break;
      case 1:
        bottomIndex.value=i;

        Get.offAllNamed(AppRouter.menu);
        break;
      case 2:
        bottomIndex.value=i;

        break;
      case 3:
        bottomIndex.value=i;
        !Get.isRegistered<ProfileController>();
          Get.put(ProfileController(Get.find()));

        // Profile
        break;
      case 4:
        bottomIndex.value=i;
        !Get.isRegistered<ProfileController>();
        Get.put(ProfileController(Get.find()));

        break;
    }

  }

  void toggleFavorite(int index) {
    products[index].isFavorite.value = !products[index].isFavorite.value;
  }


  void increaseQuantity(index){
    products[index].quantity.value++;
  }

  void deleteQuantity(index){
    products[index].quantity.value=0;
  }

  Future<List<ProductsModel>> fetchProducts() async {
    products.value = await repo.fetchedProducts();
    return products;
  }



}
