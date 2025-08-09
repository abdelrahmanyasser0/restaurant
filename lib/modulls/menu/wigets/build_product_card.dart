import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../data/models/categories_model.dart';
import '../controllers.dart';

class BuildProductCard extends StatelessWidget {
  final List<ProductsModel> model;
  final MenuViewController controller;


  const BuildProductCard({
    super.key,
    required this.model, required this.controller,

  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
        itemCount:controller.products.length,
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.white,
            child: Row(
              children: [
                Container(
                  color: AppColors.lightGrey,
                  width: 100,
                  height: 200,
                  child: Image.network(
                    model[index].imageUrl,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppAssets.apple,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(model[index].itemName, style: AppTextStyles.large),
                          const Spacer(),
                          Obx((){
                            return IconButton(
                              onPressed: (){
                                controller.toggleFavorite(index);
                              },
                              icon:  model[index].isFavorite.value?
                             Icon(Icons.favorite,color: AppColors.red,): Icon(Icons.favorite_border),
                            );
                          }),
                        ],
                      ),
                      Text(
                        model[index].itemDescription,
                        style: AppTextStyles.label,
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          Text('Customize', style: AppTextStyles.red),
                          const SizedBox(width: 5),
                          const Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: AppColors.red,
                              child: Padding(
                                padding: EdgeInsets.only(left: 2.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: AppColors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx((){
                        return


                          Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(model[index].itemPrice.toString(),
                                style: AppTextStyles.large),
                            Text(
                              (model[index].itemPrice + 100).toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const Spacer(),
                            model[index].quantity.value != 0 ?
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.deleteQuantity(index);
                                  },
                                  child: const Card(
                                    color: Colors.grey,
                                    child: Padding(
                                      padding: EdgeInsets.all(14),
                                      child: Icon(CupertinoIcons.delete),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: Text(model[index].quantity.toString(),
                                      style: AppTextStyles.large),
                                ),

                                GestureDetector(
                                  onTap: () {
                                    controller.increaseQuantity(index);
                                  },
                                  child: Card(
                                    color: AppColors.orange,
                                    child: Padding(
                                      padding: EdgeInsets.all(14),
                                      child: Icon(CupertinoIcons.add),
                                    ),
                                  ),
                                ),
                              ],
                            ) :
                            SizedBox(
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {
                                  model[index].quantity.value++;
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  padding: EdgeInsets.all(6),
                                  backgroundColor: AppColors.orange,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Text('+ Add to card',
                                    style: AppTextStyles.mediumBlack),
                              ),
                            ),
                            SizedBox(width: model[index].quantity.value != 0?0:6)
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
