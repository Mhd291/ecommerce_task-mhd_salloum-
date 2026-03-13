import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mhd_salloum_ecommerce_task/modules/product_info/product_info_controller.dart';
import 'package:mhd_salloum_ecommerce_task/modules/product_info/product_info_service.dart';

import '../../../core/helpers/api_service.dart';
import '../core/helpers/network_info_service.dart';

class ProductInfoBinding extends Bindings {
  @override
  void dependencies() {


    final networkInfo = NetworkInfoServiceImpl(InternetConnectionChecker());
    final apiService = ApiServiceImpl(http.Client(), networkInfo);


    final productInfoService = ProductInfoService(apiService, networkInfo);

    Get.put<ProductInfoController>(
      ProductInfoController(productInfoService),
      permanent: false,
    );
  }
}