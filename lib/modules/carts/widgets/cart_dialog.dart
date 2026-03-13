import 'package:flutter/material.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:responsive_s/responsive_s.dart';
import '../../../core/helpers/date_time_convert.dart';
import '../../../models/cart.dart';


class CartDialog extends StatelessWidget {
  final Cart cart;

  const CartDialog({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (sizer) => Dialog(
        backgroundColor: context.grey750,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sizer.w(16)),
        ),
        child: Container(
          width: sizer.w(300),
          padding: EdgeInsets.all(sizer.w(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                    ),
                  ),
                  Text(
                    timeAgoOrFormatted(cart.date),
                    style: context.bodyMedium?.copyWith(color: context.secondry),
                  ),
                ],
              ),

              SizedBox(height: sizer.h(12)),

              /// Divider
              Divider(color: Colors.grey.shade600),

              /// Products List
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.products.length,
                  itemBuilder: (context, index) {
                    final product = cart.products[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: sizer.h(6)),
                      child: Row(
                        children: [

                          /// Product Image Placeholder
                          Container(
                            width: sizer.w(50),
                            height: sizer.w(50),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(sizer.w(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
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

                          SizedBox(width: sizer.w(12)),

                          /// Product Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product ID: ${product.productId}",
                                  style: context.bodyMedium?.copyWith(
                                    color: context.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: sizer.h(4)),
                                Text(
                                  "Quantity: ${product.quantity}",
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
                  },
                ),
              ),

              SizedBox(height: sizer.h(16)),

              /// Close Button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: context.primary,
                    padding: EdgeInsets.symmetric(
                        horizontal: sizer.w(20), vertical: sizer.h(8)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(sizer.w(12)),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Close",
                    style: context.bodyMedium?.copyWith(
                      color: context.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}