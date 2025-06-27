import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment/core/constants/app_assets.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/core/constants/app_routers.dart';
import 'package:payment/core/constants/app_strings.dart';
import 'package:payment/core/widgets/custom_appbar.dart';
import 'package:payment/core/widgets/custom_text.dart';
import 'package:payment/modulls/profile/controllers.dart';

import '../../core/widgets/custom_button.dart';

class ProfileView extends GetView<PaymentController> {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: AppStrings.paymentMethodTitle),
      body: Obx(() {
        final List<Map<String, String>> totalList = [
          ...controller.cards.map((card) => {
            'asset': AppAssets.creditCard,
            'text': '*** *** *** ${card.cardNumber.substring(card.cardNumber.length - 2)}',
          }),
          ...controller.staticPayments

        ];

        return totalList.isNotEmpty?
        ListView.builder(
          itemCount: totalList.length,
          itemBuilder: (context, index) {
            return Obx(()=>buildCardSection(
              totalList[index]['asset']!,
              totalList[index]['text']!,
              index,
            ));
          },
        ):
        Center(
          child: CircularProgressIndicator(color: AppColors.salmon,),
        );
      }),

      bottomNavigationBar: CustomButton(
        text: AppStrings.addNewCardButton,
        onPressed: ()async{
         final result=await Get.toNamed(AppRouter.addPayment);
         if(result==true){
           controller.fetchCards();
         }
        },
      ),
    );
  }

  Widget buildCardSection(String asset, String text, int index) {
    return Column(
      children: [

        SizedBox(height: 30),
        Row(
          children: [
            const SizedBox(width: 10),
            Image.asset(asset,
                width: 50,
                height: 55,
                fit: BoxFit.cover,
                color: AppColors.salmon),
            const SizedBox(width: 15),
            Text(text, style: AppTextStyles.body),
            const Spacer(),
            Radio<int>(
              value: index,
              groupValue: controller.stat.value,
              onChanged: (value) {
                controller.togglePayment(value);
              },
              activeColor: AppColors.salmon,
              fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.salmon;
                }
                return AppColors.salmon.withOpacity(0.4);
              }),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            color: AppColors.salmon.withOpacity(0.4),
            height: 1,
          ),
        ),
      ],
    );
  }
}
