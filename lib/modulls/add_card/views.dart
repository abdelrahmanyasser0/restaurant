import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment/core/constants/app_assets.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/core/constants/app_strings.dart';
import 'package:payment/core/widgets/custom_appbar.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/core/widgets/custom_text.dart';
import 'package:payment/core/widgets/custom_textfeild.dart';
import 'package:payment/modulls/add_card/controllers.dart';


class AddPayment extends GetView<AddPaymentController> {
  const AddPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: AppStrings.addCardTitle),
      bottomNavigationBar: CustomButton(
        onPressed: () {
          if (controller.formKey.currentState!.validate()) {
            controller.onSubmitCard();
            Get.back(result: true);
          }
        },
        text: AppStrings.saveCardButton,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image(image: AssetImage(AppAssets.card)),
                    Positioned(
                      left: 10,
                      bottom: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => Text(
                            controller.numberRx.value,
                            style: AppTextStyles.body.copyWith(fontSize: 16),
                          )),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.cardHolderNameLabel,
                                      style: AppTextStyles.input),
                                  Obx(() => Text(
                                    controller.nameRx.value,
                                    style: AppTextStyles.label,
                                  )),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.expiryDateLabel,
                                      style: AppTextStyles.input),
                                  Obx(() => Text(
                                    controller.expiryRx.value,
                                    style: AppTextStyles.label,
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: AppStrings.cardHolderNameLabel,
                  controller: controller.cardNameController,
                ),
                CustomTextField(
                  label: AppStrings.cardNumberLabel,
                  controller: controller.cardNumberController,
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  minLength: 11,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 110,
                      child: CustomTextField(
                        label: AppStrings.expiryDateLabel,
                        controller: controller.expiryDateController,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: SizedBox(
                        width: 110,
                        child: CustomTextField(
                          label: AppStrings.cvvLabel,
                          controller: controller.cvvController,
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
