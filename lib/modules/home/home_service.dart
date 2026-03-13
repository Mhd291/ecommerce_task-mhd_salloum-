import '../../../core/config/app_endpoint.dart';
import '../../../core/helpers/api_service.dart';
import '../../core/config/user_info.dart';
import '../../models/categories.dart';
import '../../models/products.dart';

class HomeService {
  final ApiService apiService;

  HomeService(this.apiService);

  Future<List<String>> getCategories() async {
    final response = await apiService.get(
      "${AppEndpoints.baseUrl}${AppEndpoints.getCategories}",
      headers: {
        'Accept': 'application/json',
        'Accept-Language': UserInfo.language,
      },
    );

    return categoriesFromJson(response.body);
  }

  Future<List<Products>> getProducts() async {
    final response = await apiService.get(
      "${AppEndpoints.baseUrl}${AppEndpoints.getProducts}",
      headers: {
        'Accept': 'application/json',
        'Accept-Language': UserInfo.language,
      },
    );

    return productsFromJson(response.body);
  }
}