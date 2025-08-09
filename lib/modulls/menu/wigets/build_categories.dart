import 'package:flutter/material.dart';
import 'package:payment/modulls/menu/controllers.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../data/models/categories_model.dart';
class BuildCategoriesCard extends StatelessWidget {
  final List<ProductsModel> model;
  final MenuViewController controller;


  const BuildCategoriesCard({
    super.key,
    required this.model,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 35,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: (){
                  controller.selectedCategories=controller.products[index];
                },

                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                border: Border.all(
                color: Colors.orange,
                width: 1,
                ),
                ),
                child: Center(
                child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                const SizedBox(width: 8),
                ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                model[index].imageUrl,
                width: 30,
                height: 30,
                errorBuilder: (context, error, stackTrace) {
            return Image.asset(
            AppAssets.apple,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
            );
            },
            ),
            ),
            const SizedBox(width: 8),
            Text(
            model[index].itemName,
            style: AppTextStyles.body,
            ),
            const SizedBox(width: 8),
            ],
            ),
            ),
            ));
          },
          separatorBuilder: (context,index)=>SizedBox(width: 10,),
        ),
      ),
    );
  }
}
