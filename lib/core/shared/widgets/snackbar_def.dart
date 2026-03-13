import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController snackBarDef({required String title, required String message, required bool isBottom}) {
  return Get.snackbar(
    title,
    message,
    duration: Duration(seconds: 3),
    snackPosition: (isBottom) ? SnackPosition.BOTTOM : SnackPosition.TOP,
  );
}
