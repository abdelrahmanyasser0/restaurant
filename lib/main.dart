import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/routes/appRouter.dart';

void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute:RouterManager.menu ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
          scrolledUnderElevation: 0,

        ),
        cardTheme: CardTheme(
          color: AppColors.white,
        ),
        iconTheme: IconThemeData(color: Colors.black)
      ),
      getPages: RouterManager.routes,
    );
  }
}
