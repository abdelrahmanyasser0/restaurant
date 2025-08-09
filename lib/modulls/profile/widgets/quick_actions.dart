import 'package:flutter/cupertino.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_text.dart';

class QuickActions extends StatelessWidget{
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            _quickPill(
              asset: AppAssets.heart,
              label: 'Favorites',
            ),
            _quickPill(
              asset: AppAssets.medal,
              label: 'Rewards',
            ),
            _quickPill(
              asset: AppAssets.taxesBag ,
              label: 'Orders',
            ),
          ]),
    );
  }

  Widget _quickPill( {
    required String asset,
    required final String label
  }){
    return  Column(
      children: [
        Container(
          height: 100,
          width: 105,
          decoration: BoxDecoration(
              color: AppColors.beg,
              borderRadius: BorderRadius.circular(80)),
          child:
          Image.asset(asset, height: 57),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppTextStyles.mediumBlack),
      ],
    );
  }

}
