import 'package:flutter/material.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';
import 'package:responsive_s/responsive_s.dart';

class CtmButton extends StatelessWidget {

  VoidCallback onPressed;
  String text ;
   CtmButton({super.key,required this.onPressed , required this.text});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveWidget(builder: (sizer)=>SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: sizer.h(14)),
          backgroundColor: context.secondry,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: sizer.fontSize(16),
              fontWeight: FontWeight.bold,
              color: context.white),
        ),
      ),
    ));
  }
}
