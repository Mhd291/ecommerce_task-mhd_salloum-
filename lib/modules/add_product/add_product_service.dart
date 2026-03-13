import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mhd_salloum_ecommerce_task/core/helpers/api_service.dart';
import 'package:mhd_salloum_ecommerce_task/core/helpers/network_info_service.dart';
import '../../../core/config/app_endpoint.dart';
import '../../core/config/user_info.dart';

class AddProductService {


  AddProductService(ApiServiceImpl apiService, NetworkInfoServiceImpl networkInfoServiceImpl);

  bool _isSuccessful(int statusCode) => statusCode == 200 || statusCode == 201;

  Future<bool> createProduct({
    required String title,
    required String description,
    required String category,
    required String price,
    required List<File> images,
  }) async {

    final uri = Uri.parse( "${AppEndpoints.baseUrl}${AppEndpoints.addProduct}",);

    try {

      final request = http.MultipartRequest("POST", uri);

      request.headers.addAll({
        "Accept": "application/json",
        "Authorization": "Bearer ${UserInfo.token}",
      });

      request.fields.addAll({
        "title": title,
        "description": description,
        "category": category,
        "price": price,
      });

      for (final image in images) {
        request.files.add(
          await http.MultipartFile.fromPath("images[]", image.path),
        );
      }

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(streamedResponse);

      return _isSuccessful(response.statusCode);

    } catch (e) {
      return false;
    }
  }
}