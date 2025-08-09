import 'package:dio/dio.dart';
import 'package:payment/core/constants/app_strings.dart';
import 'package:payment/core/services/webservice.dart';
import 'package:payment/data/models/categories_model.dart';


abstract class IMenuRepository {
  Future<List<ProductsModel>> fetchedProducts();

}


class MenuRepository implements IMenuRepository {


  @override
  Future<List<ProductsModel>> fetchedProducts() async {
    try {
      final response = await WebService().get(AppStrings.getProducts);

      if (response.statusCode == null || response.statusCode! < 200 || response.statusCode! >= 300) {
        print('fetch products failed: ${response.statusCode} ${response.statusMessage}');
        return [];
      }

      final data = WebService.decodeResp(response);

      if (data is List) {
        return data.cast<Map<String, dynamic>>().map(ProductsModel.fromJson).toList();
      }

      if (data is Map && data['data'] is List) {
        return (data['data'] as List).cast<Map<String, dynamic>>().map(ProductsModel.fromJson).toList();
      }

      print('Unexpected format: ${data.runtimeType}');
      return [];
    } on DioException catch (e) {
      print('Dio error fetching products: ${e.response?.statusCode} ${e.message}');
      return [];
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }



      }

