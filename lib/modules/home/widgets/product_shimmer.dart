import 'package:flutter/material.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:shimmer/shimmer.dart';

class ProductsLoading extends StatelessWidget {
  const ProductsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (_, __) => const ProductCardShimmer(),
    );
  }
}
class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (sizer) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizer.w(12),
            vertical: sizer.h(8),
          ),
          padding: EdgeInsets.all(sizer.w(12)),
          decoration: BoxDecoration(
            color: context.white,
            borderRadius: BorderRadius.circular(sizer.w(14)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: sizer.w(110),
                height: sizer.w(110),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(sizer.w(12)),
                ),
              ),
              SizedBox(width: sizer.w(12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      height: sizer.h(14),
                      width: sizer.w(180),
                      color: Colors.grey,
                    ),

                    SizedBox(height: sizer.h(10)),

                    Container(
                      height: sizer.h(12),
                      width: sizer.w(120),
                      color: Colors.grey,
                    ),
                    SizedBox(height: sizer.h(10)),
                    Container(
                      height: sizer.h(10),
                      width: sizer.w(80),
                      color: Colors.grey,
                    ),
                    SizedBox(height: sizer.h(20)),
                    Container(
                      height: sizer.h(12),
                      width: sizer.w(90),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}