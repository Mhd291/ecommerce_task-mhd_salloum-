import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mhd_salloum_ecommerce_task/core/res/validator_def.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/widgets/ctm_button.dart';
import 'package:mhd_salloum_ecommerce_task/modules/add_product/widgets/card_section.dart';
import 'package:mhd_salloum_ecommerce_task/modules/add_product/widgets/text_field_add_product.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/shared/widgets/app_appbar.dart';
import '../../generated/locale_keys.g.dart';
import 'add_product_controller.dart';

class AddProductScreen extends StatelessWidget {

  final AddProductController controller = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ResponsiveWidget(
      builder: (sizer) {

        final h = sizer.h;
        final w = sizer.w;
        final fs = sizer.fontSize;

        return Scaffold(

          backgroundColor: Theme.of(context).scaffoldBackgroundColor,

          appBar: AppAppBar(
            title: tr(LocaleKeys.addProductTitle),
            showBack: false,
          ),

          body: SingleChildScrollView(

            padding: EdgeInsets.all(w(16)),

            child: Form(

              key: formKey,

              child: Obx(() {

                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    cardSection(
                      context: context,
                      sizer: sizer,
                      children: [

                        TextFieldAddProduct(
                          label: tr(LocaleKeys.productName),
                          hint: tr(LocaleKeys.productNameHint),
                          controller: controller.nameController,
                          validator: ValidatorDef.validatorName,
                          sizer: sizer,
                        ),

                      ],
                    ),

                    SizedBox(height: h(20)),

                    /// الفئة
                    cardSection(
                      context: context,
                      sizer: sizer,
                      children: [

                        TextFieldAddProduct(
                          label: tr(LocaleKeys.chooseProductCategory),
                          hint: tr(LocaleKeys.chooseProductCategory),
                          controller: controller.categoryController,
                          validator: ValidatorDef.validatorName,
                          sizer: sizer,
                        ),

                      ],
                    ),

                    SizedBox(height: h(20)),

                    /// الوصف
                    cardSection(
                      context: context,
                      sizer: sizer,
                      children: [

                        TextFieldAddProduct(
                          label: tr(LocaleKeys.productDescription),
                          hint: tr(LocaleKeys.productDescriptionHint),
                          controller: controller.descriptionController,
                          maxLines: 3,
                          validator: ValidatorDef.validatorName,
                          sizer: sizer,
                        ),

                      ],
                    ),

                    SizedBox(height: h(20)),

                    /// السعر
                    cardSection(
                      context: context,
                      sizer: sizer,
                      children: [

                        TextFieldAddProduct(
                          label: tr(LocaleKeys.productPrice),
                          hint: tr(LocaleKeys.productPriceHint),
                          keyboard: TextInputType.number,
                          controller: controller.priceController,
                          validator: ValidatorDef.validatorNumber,
                          sizer: sizer,
                        ),

                      ],
                    ),

                    SizedBox(height: h(20)),


                    Text(
                      tr(LocaleKeys.productImages),
                      style: TextStyle(
                        fontSize: fs(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: h(10)),

                    cardSection(
                      context: context,
                      sizer: sizer,
                      children: [

                        Obx(() {

                          if (controller.images.isEmpty) {
                            return Center(
                              child: Text(
                                tr(LocaleKeys.noImages),
                                style:  TextStyle(color: context.grey350),
                              ),
                            );
                          }

                          return GridView.builder(

                            shrinkWrap: true,

                            physics: const NeverScrollableScrollPhysics(),

                            itemCount: controller.images.length,

                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: w(10),
                              mainAxisSpacing: h(10),
                            ),

                            itemBuilder: (_, i) {

                              final img = controller.images[i];

                              return Stack(
                                children: [

                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      img,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),

                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: GestureDetector(
                                      onTap: () => controller.removeImage(i),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          shape: BoxShape.circle,
                                        ),
                                        padding: EdgeInsets.all(w(5)),
                                        child: Icon(
                                          Icons.close,
                                          color: context.white,
                                          size: w(14),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }),

                        SizedBox(height: h(12)),

                        Center(
                          child: ElevatedButton.icon(

                            onPressed: controller.pickImages,

                            icon:  Icon(
                              Icons.add_a_photo,
                              color: context.white,
                            ),

                            label: Text(tr(LocaleKeys.addImages)),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.primary,
                              padding: EdgeInsets.symmetric(
                                horizontal: w(24),
                                vertical: h(12),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: h(30)),

                    CtmButton(
                      onPressed: () {

                        if (formKey.currentState!.validate()) {
                          controller.saveProduct();
                        }

                      },
                      text: tr(LocaleKeys.saveProduct),
                    ),

                    SizedBox(height: h(20)),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}