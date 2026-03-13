import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:mhd_salloum_ecommerce_task/modules/add_product/add_product_controller.dart';
import 'package:mhd_salloum_ecommerce_task/modules/carts/carts_controller.dart';
import 'package:mhd_salloum_ecommerce_task/modules/home/home_controller.dart';

import '../core/helpers/api_service.dart';
import '../core/helpers/network_info_service.dart';
import '../modules/add_product/add_product_service.dart';
import '../modules/carts/carts_service.dart';
import '../modules/home/home_service.dart';

class DashboardBinding extends Bindings {

  @override
  void dependencies() {

    final apiService = ApiServiceImpl(
      http.Client(),
      NetworkInfoServiceImpl(InternetConnectionChecker()),
    );


    final homeService = HomeService(apiService);
    final cartsService = CartsService(apiService);
    final addProductService = AddProductService(apiService, NetworkInfoServiceImpl(InternetConnectionChecker()));


    Get.put<HomeController>(HomeController(homeService), permanent: false);
    Get.put<CartController>(CartController(cartsService), permanent: false);
    Get.put<AddProductController>(AddProductController(addProductService), permanent: false);
  }
}