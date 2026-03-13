import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mhd_salloum_ecommerce_task/modules/home/widgets/categories_appBar.dart';
import 'package:mhd_salloum_ecommerce_task/modules/home/widgets/categories_shimmer.dart';
import 'package:mhd_salloum_ecommerce_task/modules/home/widgets/product_shimmer.dart';
import 'package:responsive_s/responsive_s.dart';
import '../../core/shared/widgets/app_appbar.dart';
import '../../core/shared/widgets/product_item.dart';
import 'home_controller.dart';
import 'package:easy_localization/easy_localization.dart' as ez;
import '../../generated/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: ez.tr(LocaleKeys.marketplace),
        showBack: false,
      ),
      body: ResponsiveWidget(
        builder: (sizer) => Column(
          children: [

            Obx(() {
              if (controller.isLoadingCategories.value) {
                return const CategoriesShimmer();
              }

              return CategoriesAppbar(
                categories: controller.categories,
                mainOnTap: () {
                  controller.selectMain();
                },
                onTapCategory: (index) {
                  controller.selectCategory(index);
                },
              );
            }),

            SizedBox(height: sizer.h(10)),

            Expanded(
              child: Obx(() {
                if (controller.isLoadingProducts.value) {
                  return const ProductsLoading();
                }

                if (controller.products.isEmpty) {
                  return Center(
                    child: Text(
                      ez.tr(LocaleKeys.noProducts),
                      style: TextStyle(fontSize: sizer.fontSize(16)),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: controller.products.length,
                  padding: EdgeInsets.only(bottom: sizer.h(20)),
                  itemBuilder: (context, index) {
                    final product = controller.products[index];

                    return ProductCard(
                      productName: product.title,
                      imageUrl: product.image,
                      address: product.category.name,
                      price: product.price,
                      rating: product.rating.rate,
                      ratingCount: product.rating.count,
                      onTap: () {
                        Get.toNamed('/productInfo', arguments: product.id);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}