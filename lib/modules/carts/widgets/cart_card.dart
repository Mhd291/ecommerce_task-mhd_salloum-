import 'package:flutter/material.dart' ;
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:responsive_s/responsive_s.dart';
import '../../../core/helpers/date_time_convert.dart';
import '../../../models/carts.dart';


Widget cartCard(Carts cart, Sizer sizer , BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: sizer.h(16)),
    padding: EdgeInsets.all(sizer.w(16)),
    decoration: BoxDecoration(
     color:  Theme.of(context).brightness == Brightness.dark
         ? Colors.grey[850]
         : Colors.white,
      borderRadius: BorderRadius.circular(sizer.w(16)),
      border: Border.all(color: context.primary.withOpacity(0.4), width: 1),
      boxShadow: [
        BoxShadow(
          color: context.black2.withOpacity(0.15),
          blurRadius: sizer.w(10),
          offset: Offset(0, sizer.h(6)),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cart #${cart.id}",
              style: context.extraLargeBody?.copyWith(
                color: context.primary,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(1,1),
                  )
                ],
              ),
            ),
            Text(
              timeAgoOrFormatted(cart.date),
              style: context.bodyMedium?.copyWith(
                color: context.secondry,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        SizedBox(height: sizer.h(12)),

        /// Products
        Column(
          children: cart.products.map((p) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: sizer.h(8)),
              child: Row(
                children: [

                  /// Product image placeholder
                  Container(
                    width: sizer.w(50),
                    height: sizer.w(50),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(sizer.w(12)),
                      boxShadow: [
                        BoxShadow(
                          color: context.black2.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(2,2),
                        )
                      ],
                    ),
                    child: Icon(
                      Icons.image,
                      size: sizer.w(24),
                      color: Colors.grey[700],
                    ),
                  ),

                  SizedBox(width: sizer.w(16)),

                  /// Product info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product ID: ${p.productId}",
                          style: context.bodyMedium?.copyWith(
                            color: context.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: sizer.h(4)),
                        Text(
                          "Quantity: ${p.quantity}",
                          style: context.bodySmall?.copyWith(
                            color: context.grey350,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    ),
  );
}