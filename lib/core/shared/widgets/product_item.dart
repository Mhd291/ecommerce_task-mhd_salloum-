import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:responsive_s/responsive_s.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {

  final String productName;
  final String imageUrl;
  final String address;
  final double price;
  final double rating;
  final int ratingCount;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.address,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return ResponsiveWidget(
      builder: (sizer) => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizer.w(12),
            vertical: sizer.h(8),
          ),
          padding: EdgeInsets.all(sizer.w(12)),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[850]
                : Colors.white,
            borderRadius: BorderRadius.circular(sizer.w(14)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: sizer.w(6),
                offset: Offset(0, sizer.h(3)),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(sizer.w(12)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: sizer.w(110),
                  height: sizer.w(110),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: sizer.w(110),
                      height: sizer.w(110),
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: sizer.w(110),
                    height: sizer.w(110),
                    color: Colors.grey,
                    child: Icon(Icons.broken_image,
                        size: sizer.w(35), color: Colors.white),
                  ),
                ),
              ),

              SizedBox(width: sizer.w(12)),

              /// Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      productName,
                      style: context.bodyRegular,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: sizer.h(8)),

                    Row(
                      children: [
                        Icon(Icons.category,
                            size: sizer.w(15),
                            color: context.primary),
                        SizedBox(width: sizer.w(4)),
                        Expanded(
                          child: Text(
                            address,
                            style: context.bodySmall?.copyWith(color: Colors.grey,),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: sizer.h(6)),

                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: sizer.w(16),
                          color: context.primary,
                        ),

                        SizedBox(width: sizer.w(4)),

                        Text(
                          price.toStringAsFixed(0),
                          style: context.bodySmall?.copyWith(
                            color: context.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: sizer.h(12)),

                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: sizer.w(16),
                          color: Colors.amber,
                        ),

                        SizedBox(width: sizer.w(4)),

                        Text(
                          rating.toStringAsFixed(1),
                          style: context.bodySmall?.copyWith(
                            color: context.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(width: sizer.w(4)),

                        Text(
                          '($ratingCount)',
                          style: context.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
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