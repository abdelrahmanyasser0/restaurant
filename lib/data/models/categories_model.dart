

import 'package:get/get.dart';

class ProductsModel {
  final int itemID;
  final String itemName;
  final String itemDescription;
  final double itemPrice;
  final String restaurantName;
  final int restaurantID;
  final String imageUrl;
  final RxBool isFavorite;
  final RxInt quantity;

  ProductsModel({
    required this.itemID,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.restaurantName,
    required this.restaurantID,
    required this.imageUrl,
    required this.isFavorite,
    required this.quantity
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      itemID: json['itemID'],
      itemName: json['itemName'],
      itemDescription: json['itemDescription'],
      itemPrice: json['itemPrice'],
      restaurantName: json['restaurantName'],
      restaurantID: json['restaurantID'],
      imageUrl: json['imageUrl'],
      isFavorite:false.obs,
      quantity: 1.obs
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemID': itemID,
      'itemName': itemName,
      'itemDescription': itemDescription,
      'itemPrice': itemPrice,
      'restaurantName': restaurantName,
      'restaurantID': restaurantID,
      'imageUrl': imageUrl,
    };
  }
}
