import 'package:get/get.dart';
import '../../models/products.dart';
import 'home_service.dart';

class HomeController extends GetxController {

  final HomeService service;

  HomeController(this.service);

  RxBool isLoadingCategories = false.obs;
  RxBool isLoadingProducts = false.obs;
  RxList<String> categories = <String>[].obs;
  RxList<Products> products = <Products>[].obs;
  RxInt selectedCategory = (-1).obs;

  @override
  void onInit() {
    getCategories();
    getProducts();
    super.onInit();
  }

  Future<void> getCategories() async {
    isLoadingCategories.value = true;

    final result = await service.getCategories();

    categories.assignAll(result);

    isLoadingCategories.value = false;
  }


  Future<void> getProducts() async {
    isLoadingProducts.value = true;

    final result = await service.getProducts();

    products.assignAll(result);

    isLoadingProducts.value = false;
  }


  void selectMain() {
    selectedCategory.value = -1;
    getProducts();
  }

  void selectCategory(int index) {
    selectedCategory.value = index;
    getProducts();
  }
}