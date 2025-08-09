import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:payment/modulls/menu/controllers.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_text.dart';

class BuildNavBar extends StatelessWidget{
  final MenuViewController controller;
  const BuildNavBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,

      children: [
        Obx(() => BottomNavigationBar(
          backgroundColor: AppColors.white,
          currentIndex: controller.bottomIndex.value,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.orange,
          selectedIconTheme: IconThemeData(
              color: AppColors.orange
          ),
          unselectedIconTheme: IconThemeData(
              color: AppColors.black
          ),
          unselectedItemColor: Colors.black54,
          items: [
            BottomNavigationBarItem(
                label: 'Home',icon: ImageIcon(AssetImage(AppAssets.home))),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.menu)), label: 'Menu'),
            BottomNavigationBarItem(
              icon: Stack(alignment: Alignment.center, children:  [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.orange,
                  child: Image(
                    image: AssetImage(AppAssets.taxesBag),
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: -9,
                  left: 0,
                  child: Card(
                    color: AppColors.white,
                    shape:CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('12',
                          style: AppTextStyles.input),
                    ),
                  ),
                ),
              ]),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.person)), label: 'Profile'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.more)), label: 'More'),
          ],
        )),

        Positioned(
          left: 0, right: 0, bottom:kBottomNavigationBarHeight+48,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9B3A2B),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('view cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                      SizedBox(width: 12),
                      Text('333 BD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                CustomPaint(
                  size: const Size(16, 9),
                  painter: _DownArrowPainter(AppColors.red),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}

class _DownArrowPainter extends CustomPainter {
  final Color color;
  const _DownArrowPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();
    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


