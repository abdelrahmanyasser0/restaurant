import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/core/constants/app_strings.dart';
import 'package:payment/core/widgets/custom_appbar.dart';
import 'package:payment/modulls/menu/controllers.dart';
import 'package:payment/modulls/menu/wigets/build_categories.dart';
import 'package:payment/modulls/menu/wigets/build_nav_bar.dart';
import 'package:payment/modulls/menu/wigets/build_product_card.dart';
import 'package:payment/modulls/profile/views.dart';

import '../../core/widgets/custom_button.dart';

class MenuView extends GetView<MenuViewController> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.white,
        appBar: controller.bottomIndex.value == 1 ? CustomAppBar(
          title: AppStrings.menuAppbarTitle,
          actions: [
            CustomButton(
              widget: Icon(Icons.search, color: AppColors.black, size: 25),
              onPressed: () {},
            ),
          ],
        ) : null,
        body: controller.bottomIndex.value == 1 ?
        controller.products.isNotEmpty
            ? Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BuildCategoriesCard(
                model: controller.products, controller: controller),
            BuildProductCard(
                model: controller.products, controller: controller),
          ],
        )
            : Center(child: CircularProgressIndicator(color: AppColors.red)) :

        const Profile(),
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0, right: 0, bottom: 0,
              child: BuildNavBar(controller: controller),
            ),

          ],
        ),
      );
    });
  }



}

