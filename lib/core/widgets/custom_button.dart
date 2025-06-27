import 'package:flutter/material.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget{
  final String? text;
  final Function ()?onPressed;

  const CustomButton({

    super.key,required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:onPressed! ,
        child:Container(
          height: 50,
          decoration:  BoxDecoration(
            color: AppColors.salmon,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text!,
              style: AppTextStyles.button,
            ),
          ),
        ),

    );
  }

}