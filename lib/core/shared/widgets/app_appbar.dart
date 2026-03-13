import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_s/responsive_s.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget? leading;

  const AppAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.actions,
    this.backgroundColor,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (sizer) => AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor:
            backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,

        leading:
            leading ??
            (showBack
                ? IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, size: sizer.w(18)),
                    onPressed: () {
                      Get.back();
                    },
                  ): null),

        title: Text(
          title,
          style: TextStyle(
            fontSize: sizer.fontSize(16),
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
