import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';

Widget cardSection({
  required Sizer sizer,
  required List<Widget> children,
  required BuildContext context,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(sizer.w(16)),
    margin: EdgeInsets.only(bottom: sizer.h(16)),
    decoration: BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[850]
          : Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: sizer.radius(6),
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}