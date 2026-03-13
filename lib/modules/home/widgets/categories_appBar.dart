import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:mhd_salloum_ecommerce_task/generated/locale_keys.g.dart';
import 'package:responsive_s/responsive_s.dart';

class CategoriesAppbar extends StatelessWidget {
  final VoidCallback mainOnTap;
  final Function(int index) onTapCategory;
  final List<String> categories;

  CategoriesAppbar({
    super.key,
    required this.mainOnTap,
    required this.onTapCategory,
    required this.categories,
  });

  final CatAppBarController controller = Get.put(CatAppBarController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (sizer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: sizer.h(12)),

          SizedBox(
            height: sizer.h(32),
            child: Obx(
                  () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                    GestureDetector(
                      onTap: () {
                        controller.selectMain();
                        mainOnTap();
                      },
                      child: levelChip(
                        tr(LocaleKeys.main),
                        controller.isMain.value,
                        context,
                        sizer,
                      ),
                    ),


                    Row(
                      children: [
                        for (int i = 0; i < categories.length; i++)
                          GestureDetector(
                            onTap: () {
                              controller.selectCategory(i);
                              onTapCategory(i);
                            },
                            child: levelChip(
                              categories[i],
                              controller.selectedIndex.value == i &&
                                  controller.isMain.value == false,
                              context,
                              sizer,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatAppBarController extends GetxController {
  RxInt selectedIndex = (-1).obs;
  RxBool isMain = true.obs;

  void selectCategory(int i) {
    selectedIndex.value = i;
    isMain.value = false;
  }

  void selectMain() {
    selectedIndex.value = -1;
    isMain.value = true;
  }
}

Widget levelChip(
    String text,
    bool active,
    BuildContext context,
    Sizer sizer,
    ) {
  final primary = Theme.of(context).primaryColor;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 180),
    margin: EdgeInsets.symmetric(horizontal: sizer.w(4)),
    padding: EdgeInsets.symmetric(
      horizontal: sizer.w(16),
      vertical: sizer.h(6),
    ),
    decoration: BoxDecoration(
      color: active ? primary : Colors.white,
      borderRadius: BorderRadius.circular(sizer.w(14)),
      border: Border.all(
        color: primary,
        width: sizer.w(1),
      ),
    ),
    child: Text(
      text,
      style: context.bodyMedium?.copyWith( color: active ? context.white : primary,),
    ),
  );
}