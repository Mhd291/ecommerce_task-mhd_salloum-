import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mhd_salloum_ecommerce_task/bindings/add_product_binding.dart';
import 'package:mhd_salloum_ecommerce_task/bindings/dashboard_binding.dart';
import 'package:mhd_salloum_ecommerce_task/bindings/product_info_binding.dart';
import 'package:responsive_s/responsive_s.dart';
import 'core/config/user_info.dart';
import 'core/constants/app_frame_constants.dart';
import 'core/services/localization/localization_constant.dart';
import 'core/shared/enum/shared_enums.dart';
import 'core/shared/managers/themes_manager/text_theme_manager/custom_text_theme.dart';
import 'core/shared/managers/themes_manager/themes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'modules/add_product/add_product_screen.dart';
import 'modules/carts/carts_screen.dart';
import 'modules/dashboard/dashboard_screen.dart';
import 'modules/home/home_screen.dart';
import 'modules/product_info/product_info_screen.dart';
import 'modules/splash/splash_screen.dart';

class App extends StatelessWidget {
  static Flavors flavor = Flavors.development;

  App._internal();

  static final App instance = App._internal();

  @override
  Widget build(BuildContext context) {
    UserInfo.language = context.locale.languageCode;
    return ColorManager(
      child: ResponsiveWrapper(
        frame: Frame(
          desktopFrame: AppFrameConstants.desktop,
          tabletPortraitFrame: AppFrameConstants.tablet,
          mobilePortraitFrame: AppFrameConstants.mobile,
        ),
        child: ResponsiveWidget(
          builder: (sizer) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'mhd_salloum_ecommerce_task',
            key: ValueKey(context.locale.languageCode),
            locale: EasyLocalization.of(context)!.locale,
            supportedLocales: LocalizationConstant.supportedLocales,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              EasyLocalization.of(context)!.delegate,
            ],

            theme: ThemesManager.lightTheme(CustomTextTheme(sizer: sizer)),
            darkTheme: ThemesManager.darkTheme(CustomTextTheme(sizer: sizer)),
            initialRoute: '/splash',
            getPages: [
              GetPage(
                name: '/dashboard',
                page: () => DashboardScreen(),
                binding: DashboardBinding(),
              ),
              GetPage(name: '/home', page: () => HomeScreen()),
              GetPage(name: '/splash', page: () => SplashScreen()),
              GetPage(
                name: '/productInfo',
                page: () => ProductInfoScreen(),
                binding: ProductInfoBinding(),
              ),
              GetPage(name: '/carts', page: () => CartsScreen()),
              GetPage(
                name: '/addProduct',
                page: () => AddProductScreen(),
                binding: AddProductBinding(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
