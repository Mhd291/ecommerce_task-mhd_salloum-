import 'package:flutter/material.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:responsive_s/responsive_s.dart';


class TextFieldAddProduct extends StatelessWidget {
  const TextFieldAddProduct({
    super.key,
    required this.label,
    this.hint,
    required this.sizer,
    this.icon,
    this.validator,
    this.keyboard,
    required this.controller,
    this.maxLines = 1,
  });

  final String label;
  final String? hint;
  final IconData? icon;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final TextEditingController controller;
  final int maxLines;
  final Sizer sizer;

  @override
  Widget build(BuildContext context) {

    final h = sizer.h;
    final w = sizer.w;
    final fs = sizer.fontSize;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: TextStyle(
            fontSize: fs(15),
            fontWeight: FontWeight.w600,
            color: context.primary,
          ),
        ),

        SizedBox(height: h(8)),

        TextFormField(
          controller: controller,
          keyboardType: keyboard,
          validator: validator,
          maxLines: maxLines,

          decoration: InputDecoration(

            hintText: hint,

            hintStyle: TextStyle(
              fontSize: fs(13),
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : context.grey900,
            ),

            filled: true,

            fillColor: Theme.of(context).brightness == Brightness.dark
                ? context.grey750
                : Colors.grey.shade100,

            contentPadding: EdgeInsets.symmetric(
              horizontal: w(14),
              vertical: h(14),
            ),

            prefixIcon: icon != null
                ? Icon(icon, color: context.primary, size: w(18))
                : null,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(w(12)),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(w(12)),
              borderSide: BorderSide(
                color: context.primary,
                width: 1.4,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(w(12)),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(w(12)),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}