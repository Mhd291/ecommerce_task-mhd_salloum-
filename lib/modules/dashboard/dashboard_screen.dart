import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:mhd_salloum_ecommerce_task/modules/add_product/add_product_screen.dart';
import 'package:mhd_salloum_ecommerce_task/modules/carts/carts_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:responsive_s/responsive_s.dart';
import '../home/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../generated/locale_keys.g.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: ResponsiveWidget(
        builder: (sizer) {
          final double iconSize = sizer.w(24);
          final double navBarHeight = sizer.h(78);

          return PersistentTabView(
            tabs: [
              _tab(
                title: tr(LocaleKeys.home),
                icon: LucideIcons.house,
                iconSize: iconSize,
                screen: HomeScreen(),
                context: context,
              ),
              _tab(
                title: tr(LocaleKeys.addProductTitle),
                icon: LucideIcons.plus,
                iconSize: iconSize,
                screen: AddProductScreen(),
                context: context,
              ),
              _tab(
                title: tr(LocaleKeys.yourCarts),
                icon: LucideIcons.shoppingCart,
                iconSize: iconSize,
                screen: CartsScreen(),
                context: context,
              ),

            ],
            navBarBuilder: (navBarConfig) => Style12BottomNavBar(
              navBarConfig: navBarConfig,
              height: navBarHeight,
              navBarDecoration: NavBarDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: sizer.w(14),
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// ===== Reusable Tab =====
  PersistentTabConfig _tab({
    required String title,
    required IconData icon,
    required double iconSize,
    required Widget screen,
    required BuildContext context,
  }) {
    return PersistentTabConfig(
      screen: screen,
      item: ItemConfig(
        title: title,
        iconSize: iconSize,
        activeForegroundColor: context.primary,
        inactiveForegroundColor: context.grey750,
        icon: Icon(icon),
      ),
    );
  }
}
