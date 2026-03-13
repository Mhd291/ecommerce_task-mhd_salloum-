import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (sizer) => SizedBox(
        height: sizer.h(40),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: sizer.w(12)),
            itemCount: 6,
            separatorBuilder: (_, __) => SizedBox(width: sizer.w(8)),
            itemBuilder: (_, __) => Container(
              width: sizer.w(90),
              height: sizer.h(28),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(sizer.w(14)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}