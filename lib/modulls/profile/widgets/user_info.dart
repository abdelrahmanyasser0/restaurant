import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:payment/core/widgets/custom_divider.dart';
import 'package:payment/modulls/profile/controllers.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_text.dart';

class UserInfo extends StatelessWidget{
final  ProfileController controller;
  const UserInfo({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(

        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: -8,
              child: TextButton.icon(
                onPressed: (){},
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black87),
                icon: Image.asset(AppAssets.logout,width: 30,fit: BoxFit.cover,),
                label:  Text('Logout',
                    style:AppTextStyles.bodyGrey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 28,
                            backgroundColor: AppColors.mediumGray,
                            child: Text('A',
                                style: AppTextStyles.headline),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Obx(() => Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(controller.userName.value,
                                      style: AppTextStyles.body),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Image.asset(
                                        AppAssets.egFlag,
                                        height: 14,
                                        width: 20,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(width: 5),
                                      Text(controller.userPhone.value,
                                          style:AppTextStyles.input),
                                    ],
                                  ),

                                  const SizedBox(height: 2),
                                  Text(controller.userEmail.value,
                                      style: AppTextStyles.bodyGrey),
                                ])),
                          ),
                        ]),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: SizedBox(
                        height: 44,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.orange,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('Update Profile',
                              style: AppTextStyles.body),
                        ),
                      ),
                    ),
                  ]),
            ),

          ],
        ),
      ),
    );
  }

}