import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/helpers/api_service.dart';
import '../core/helpers/network_info_service.dart';
import '../modules/add_product/add_product_controller.dart';
import '../modules/add_product/add_product_service.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {


    final networkInfo = NetworkInfoServiceImpl(InternetConnectionChecker());
    final apiService = ApiServiceImpl(http.Client(), networkInfo);


    final addProductService = AddProductService(apiService, networkInfo);

    Get.put<AddProductController>(
      AddProductController(addProductService),
      permanent: false,
    );
  }
}