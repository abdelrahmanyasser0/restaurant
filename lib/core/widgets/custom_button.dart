import 'package:flutter/material.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget{
  final Widget? widget;
  final Function ()?onPressed;

  const CustomButton({

    super.key,required this.widget, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:onPressed! ,
        child:widget!,

    );
  }

}