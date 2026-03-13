import 'package:get/get.dart';
import 'package:mhd_salloum_ecommerce_task/models/product.dart';
import 'package:mhd_salloum_ecommerce_task/modules/product_info/product_info_service.dart';
import 'package:easy_localization/easy_localization.dart' as ez;
import '../../generated/locale_keys.g.dart';

class ProductInfoController extends GetxController {

  final ProductInfoService service;
  ProductInfoController(this.service);

  RxBool isLoadingProduct = false.obs;
  RxBool isAddingToCart = false.obs;
  Rxn<Product> product = Rxn<Product>();
  RxInt quantity = 1.obs;
  late int productId;

  @override
  void onInit() {
    productId = Get.arguments;
    getProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    isLoadingProduct.value = true;

    final result = await service.getProduct(productId);
    product.value = result;

    isLoadingProduct.value = false;
  }

  void increaseQty() {
    quantity.value++;
  }

  void decreaseQty() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  Future<void> addToCart() async {

    if (product.value == null) return;

    try {
      isAddingToCart.value = true;

      final result = await service.addToCart(
        userId: 1,
        productId: product.value!.id,
        quantity: quantity.value,
      );

      Get.snackbar(
        ez.tr(LocaleKeys.success),
        ez.tr(LocaleKeys.productAddedToCart),
        snackPosition: SnackPosition.BOTTOM,
      );

    } catch (e) {
      Get.snackbar(
        ez.tr(LocaleKeys.error),
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );

    } finally {
      isAddingToCart.value = false;
    }
  }
}