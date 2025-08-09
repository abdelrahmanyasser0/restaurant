import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/core/constants/app_strings.dart';
import 'package:payment/core/widgets/custom_appbar.dart';
import 'package:payment/modulls/profile/widgets/menu_items.dart';
import 'package:payment/modulls/profile/widgets/quick_actions.dart';
import 'package:payment/modulls/profile/widgets/swich_row.dart';
import 'package:payment/modulls/profile/widgets/user_info.dart';

import '../../core/widgets/custom_divider.dart';
import 'controllers.dart';

class Profile extends GetView<ProfileController> {
  const Profile({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          leading: IconButton(
            icon: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.mediumGray,
                child: const Icon(
                  Icons.arrow_back_ios_sharp, color :AppColors.black,size: 20, weight: 800,)),
            color: Colors.black,
            onPressed: () => Get.back(),
          ),
          title: AppStrings.profileAppbarTitle
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header card
            CustomDivider(height: 6),

            UserInfo(controller: controller),
            const SizedBox(height: 16),

            // Quick actions
            QuickActions(),

            const SizedBox(height: 8),
            const CustomDivider(height: 11),
            MenuItems(),

            CustomDivider(height: 11),

            const SizedBox(height: 8),

            SwitchRow(controller: controller),
            const SizedBox(height: 12),
          ],
        ),
      ),

    );
  }


}







