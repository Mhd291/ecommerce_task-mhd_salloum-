import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mhd_salloum_ecommerce_task/modules/carts/widgets/cart_card.dart';
import 'package:mhd_salloum_ecommerce_task/modules/carts/widgets/cart_dialog.dart';
import 'package:responsive_s/responsive_s.dart';
import '../../core/shared/widgets/app_appbar.dart';
import '../../core/shared/widgets/progress_def.dart';
import '../../models/cart.dart';
import '../../models/carts.dart';
import 'carts_controller.dart';
import 'package:easy_localization/easy_localization.dart' as ez;
import '../../generated/locale_keys.g.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();

    return ResponsiveWidget(
      builder: (sizer) => Scaffold(
        appBar: AppAppBar(
          title: ez.tr(LocaleKeys.yourCarts),
          showBack: false,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: Text(ez.tr(LocaleKeys.loading)),
            );
          }

          if (controller.cartsList.isEmpty) {
            return Center(
              child: Text(ez.tr(LocaleKeys.noCartsAvailable)),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(sizer.w(12)),
            itemCount: controller.cartsList.length,
            itemBuilder: (context, index) {
              final Carts cart = controller.cartsList[index];
              return GestureDetector(
                onTap: () async {
                  progressDef(context);
                  final Cart single = await controller.fetchSingleCart(cart.id);
                  Get.back();
                  showDialog(
                    context: context,
                    builder: (_) => CartDialog(cart: single),
                  );
                },
                child: cartCard(cart, sizer, context),
              );
            },
          );
        }),
      ),
    );
  }
}