import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mhd_salloum_ecommerce_task/core/shared/extensions/context_extension.dart';

Future<dynamic> progressDef(BuildContext context){
  return Get.dialog(
    transitionDuration: Duration(seconds: 4),
    barrierDismissible: false,
      Center(
    child: CircularProgressIndicator(color:context.primary,)
  ),
  ).timeout(Duration(seconds: 10),onTimeout: (){
    Get.back();
  });
}
