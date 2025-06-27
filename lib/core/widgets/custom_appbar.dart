import 'package:flutter/material.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/core/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  const CustomAppBar({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Text(title!,style: AppTextStyles.appbar,),
      centerTitle: true,
      leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.grey,)),
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(56);
  
}