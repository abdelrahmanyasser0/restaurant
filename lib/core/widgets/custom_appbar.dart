import 'package:flutter/material.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/core/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({super.key,required this.title,this.actions,this.leading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: AppBar(
        backgroundColor: AppColors.white,
        title: Text(title!,style: AppTextStyles.large,),
        leading: leading,
        actions:actions,
      ),
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(56);
  
}