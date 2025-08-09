import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:payment/core/constants/app_assets.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/core/widgets/custom_text.dart';

import '../controllers.dart';

class SwitchRow extends StatelessWidget{
  final ProfileController controller;
  const SwitchRow({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {

    return  Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _switchRow(
              title: 'Marketing Communication',
              icon:AppAssets.marketing,
              subtitle:
              'Once you open it you will receive emails and offer on your inbox',
              value: controller.marketingComm.value,
              onChanged: controller.toggleMarketing,
            ),
            const SizedBox(height: 10),
            _switchRow(
              title: 'App Communication',
              icon: AppAssets.mobile,
              subtitle:
              'Once you open it you will receive Notifications from our app',
              value: controller.appComm.value,
              onChanged: controller.toggleAppComm,
            ),
            const SizedBox(height: 150),

          ]),
    )
    );
  }

}
Widget _switchRow({
  required String title,
  required String subtitle,
  required bool value,
  required String icon,
  required ValueChanged<bool> onChanged,
}) {
  return Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Padding(
      padding: const EdgeInsets.only(top: 4.0,right: 10),
      child: Image(image: AssetImage(icon),width: 21,fit: BoxFit.cover,),
    ),
    Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: AppTextStyles.mediumBlack16),
            const SizedBox(height: 4),
            Text(subtitle, style: AppTextStyles.bodyGrey12),
          ]),
    ),
    Switch(
        value: value,
      onChanged: onChanged,
      activeColor: AppColors.orange,
      inactiveThumbColor: AppColors.lightGrey,
      activeTrackColor: AppColors.black,
      inactiveTrackColor: AppColors.black,
      thumbIcon: MaterialStateProperty.resolveWith<Icon?>((states) {
          return Icon(Icons.check, size: 16, color: AppColors.black, shadows: [
            BoxShadow(
                color: AppColors.orange.withOpacity(.3)
            )
          ],);


      }),
    ),
  ]);
}