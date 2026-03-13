import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/shared/widgets/app_appbar.dart';
import 'product_info_controller.dart';
import 'package:easy_localization/easy_localization.dart' as ez;
import '../../generated/locale_keys.g.dart';

class ProductInfoScreen extends StatelessWidget {
  const ProductInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final ProductInfoController controller = Get.find();

    return ResponsiveWidget(
      builder: (sizer) => Scaffold(

        appBar: AppAppBar(
          title: ez.tr(LocaleKeys.productDetails),
        ),

        bottomNavigationBar: Container(
          padding: EdgeInsets.all(sizer.w(16)),
          decoration: BoxDecoration(
            color: context.grey900,
            boxShadow: [
              BoxShadow(
                color: context.black2.withOpacity(.1),
                blurRadius: 10,
              )
            ],
          ),
          child: ElevatedButton.icon(
            icon: Icon(Icons.shopping_cart_outlined,color: context.white),
            label: Text(
              ez.tr(LocaleKeys.addToCart),
              style: context.bodyRegular?.copyWith(color: context.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.primary,
              padding: EdgeInsets.symmetric(vertical: sizer.h(16)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () {
              _showAddToCartSheet(context, controller, sizer);
            },
          ),
        ),

        body: Obx(() {

          if (controller.isLoadingProduct.value) {
            return _loadingView(sizer, context);
          }

          final product = controller.product.value;

          if (product == null) {
            return Center(
              child: Text(ez.tr(LocaleKeys.failedLoadProduct)),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.all(sizer.w(14)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(sizer.radius(18)),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      height: sizer.h(280),
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (_, __) =>
                          _shimmerBox(height: sizer.h(280), radius: 18, ctx: context),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizer.w(16)),
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontSize: sizer.fontSize(18),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(height: sizer.h(10)),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizer.w(16)),
                  child: Text(
                    "\$ ${product.price}",
                    style: context.bodyExtraLarge?.copyWith(
                      color: context.primary,
                    ),
                  ),
                ),

                SizedBox(height: sizer.h(20)),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizer.w(14)),
                  child: Container(
                    padding: EdgeInsets.all(sizer.w(16)),
                    decoration: BoxDecoration(
                      color: context.white,
                      borderRadius: BorderRadius.circular(sizer.radius(16)),
                    ),
                    child: Text(
                      product.description,
                      style: context.bodyRegular?.copyWith(
                        color: context.grey625,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: sizer.h(100)),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _loadingView(Sizer sizer, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sizer.w(14)),
      child: Column(
        children: [
          _shimmerBox(height: sizer.h(280), radius: sizer.radius(18), ctx: context),
        ],
      ),
    );
  }

  Widget _shimmerBox({
    double? width,
    required double height,
    double radius = 8,
    required BuildContext ctx,
  }) {
    return Shimmer.fromColors(
      baseColor: ctx.grey350,
      highlightColor: ctx.grey350,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: ctx.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

void _showAddToCartSheet(
    BuildContext context,
    ProductInfoController controller,
    Sizer sizer,
    ) {

  Get.bottomSheet(

    Container(

      padding: EdgeInsets.all(sizer.w(20)),

      decoration: BoxDecoration(
        color: context.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(sizer.radius(24)),
        ),
      ),

      child: Obx(() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            width: sizer.w(40),
            height: sizer.h(4),
            decoration: BoxDecoration(
              color: context.grey350,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          SizedBox(height: sizer.h(20)),

          Text(
            ez.tr(LocaleKeys.chooseQuantity),
            style: context.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.primary
            ),
          ),

          SizedBox(height: sizer.h(20)),

          /// Quantity Selector
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: sizer.w(20),
              vertical: sizer.h(10),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: context.grey350),
                borderRadius: BorderRadius.circular(12),
                color: context.grey750
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// MINUS
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: controller.decreaseQty,
                ),

                Text(
                  controller.quantity.value.toString(),
                  style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// PLUS
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: controller.increaseQty,
                ),
              ],
            ),
          ),

          SizedBox(height: sizer.h(25)),

          /// CONFIRM BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: context.primary,
                padding: EdgeInsets.symmetric(
                  vertical: sizer.h(16),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              onPressed: controller.isAddingToCart.value
                  ? null
                  : () async {

                await controller.addToCart();

                Get.back();

                Get.snackbar(
                  ez.tr(LocaleKeys.success),
                  ez.tr(LocaleKeys.productAddedToCart),
                  snackPosition: SnackPosition.BOTTOM,
                );
              },

              child: controller.isAddingToCart.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                ez.tr(LocaleKeys.confirmAddToCart),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),

          SizedBox(height: sizer.h(10)),

        ],
      )),
    ),
  );
}