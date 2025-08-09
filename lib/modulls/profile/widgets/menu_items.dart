import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment/core/constants/app_assets.dart';
import 'package:payment/core/widgets/custom_text.dart';

class MenuItems extends StatelessWidget{
  const MenuItems({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _menuTile(
          title: 'My Addresses',
          icon: AppAssets.location,
        ),
        _menuTile(
          title: 'Change Password',
          icon: AppAssets.key,
        ),
        _menuTile(
            title: 'Offers',
            icon: AppAssets.star),
        _menuTile(
          title: 'Deals',
          icon: AppAssets.deal ),
        _menuTile(
          title: 'Notifications',
          icon: AppAssets.notification,
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            child: const Row(children: [
              SizedBox(width: 4),
              Image(image: AssetImage(AppAssets.delAccount),width: 20,),
              SizedBox(width: 16),
              Text('Delete my Account',
                  style:AppTextStyles.red),
            ]),
          ),
        ),
      ],
    );
  }
  Widget _menuTile(
      {required String title,
        required String icon,
      }) {
    return ListTile(
      leading: Image.asset(icon,),
      minLeadingWidth: 0,
      title:
      Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}