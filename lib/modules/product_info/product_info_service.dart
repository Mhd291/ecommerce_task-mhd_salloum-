import 'dart:convert';

import 'package:mhd_salloum_ecommerce_task/core/helpers/network_info_service.dart';

import '../../../core/config/app_endpoint.dart';
import '../../../core/helpers/api_service.dart';
import '../../core/config/user_info.dart';
import '../../models/product.dart';

class ProductInfoService {

  final ApiService apiService;

  ProductInfoService(this.apiService, NetworkInfoServiceImpl networkInfo);

  Future<Product> getProduct(int productId) async {

    final response = await apiService.get(
     "${AppEndpoints.baseUrl}${AppEndpoints.getSingleProduct}$productId",
      headers: {
        'Accept': 'application/json',
        'Accept-Language': UserInfo.language,
      },
    );

    return productFromJson(response.body);
  }

  Future<Map<String, dynamic>> addToCart({
    required int userId,
    required int productId,
    required int quantity,
  }) async {

    final body = {
      "userId": userId,
      "products": [
        {
          "id": productId,
          "quantity": quantity,
        }
      ]
    };

    final response = await apiService.post(
      "${AppEndpoints.baseUrl}${AppEndpoints.addNewCart}",
      body: body,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}