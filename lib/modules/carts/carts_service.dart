import '../../../core/config/app_endpoint.dart';
import '../../../core/helpers/api_service.dart';
import '../../core/config/user_info.dart';
import '../../models/cart.dart';
import '../../models/carts.dart';

class CartsService {

  final ApiService apiService;

  CartsService(this.apiService);

  Future<List<Carts>> getCarts() async {

    final response = await apiService.get(
      "${AppEndpoints.baseUrl}${AppEndpoints.getAllCarts}",
      headers: {
        'Accept': 'application/json',
        'Accept-Language': UserInfo.language,
      },
    );

    return cartsFromJson(response.body);
  }

  Future<Cart> singleCart(int cartId) async {

    final response = await apiService.get(
      "${AppEndpoints.baseUrl}${AppEndpoints.getSingleCart}$cartId",
      headers: {
        'Accept': 'application/json',
        'Accept-Language': UserInfo.language,
      },
    );

    return cartFromJson(response.body);
  }
}