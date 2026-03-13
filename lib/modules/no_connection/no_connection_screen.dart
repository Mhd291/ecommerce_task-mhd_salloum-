import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../generated/locale_keys.g.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ResponsiveWidget(
        builder: (sizer) => Container(
          height: size.height,
          width: size.width,
          color: Colors.grey,
          child: Center(
            child: Container(
              height: size.width * 0.9,
              width: size.width * 0.9,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.width / 2.1,
                    width: size.width / 2.1,
                    child: Image.asset(
                      "assets/images/salloum_logo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        tr(LocaleKeys.welcome),
                        style: TextStyle(
                          color: context.primary,
                          fontSize: sizer.fontSize(16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        tr(LocaleKeys.checkInternet),
                        style: TextStyle(
                          color: context.primary,
                          fontSize: sizer.fontSize(16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        tr(LocaleKeys.retry),
                        style: TextStyle(
                          color: context.primary,
                          fontSize: sizer.fontSize(16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(
                        height: sizer.h(25),
                        color: context.grey900,
                        thickness: 0.3,
                        indent: size.width / 25,
                        endIndent: size.width / 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed('/dashboard');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tr(LocaleKeys.retryButton),
                              style: TextStyle(
                                color: context.secondry,
                                fontSize: sizer.fontSize(18),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                             SizedBox(width: sizer.w(4)),
                            Icon(
                              Icons.refresh,
                              color: context.secondry,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
