import 'package:flutter/cupertino.dart';

import '../constants/app_colors.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  const CustomDivider({super.key,required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: AppColors.lightGrey,
    );
  }
}
