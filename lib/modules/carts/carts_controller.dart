import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:mhd_salloum_ecommerce_task/generated/locale_keys.g.dart';
import 'package:mhd_salloum_ecommerce_task/modules/carts/carts_service.dart';
import '../../../models/carts.dart';
import '../../models/cart.dart';

class CartController extends GetxController {
  final CartsService service;

  CartController(this.service);
  final RxBool isLoading = false.obs;
  final RxList<Carts> cartsList = <Carts>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllCarts();
  }

  Future<void> fetchAllCarts() async {
    isLoading.value = true;

    try {
      final result = await service.getCarts();
      cartsList.assignAll(result);
    } catch (e) {
      Get.snackbar(
        tr(LocaleKeys.error),
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<Cart> fetchSingleCart(int cartId) async {
    try {
      final result = await service.singleCart(cartId);
      return result;
    } catch (e) {
      Get.snackbar(
        tr(LocaleKeys.error),
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }
}