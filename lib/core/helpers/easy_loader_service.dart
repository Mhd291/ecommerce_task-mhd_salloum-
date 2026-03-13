// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
//
// class EasyLoaderService extends GetxService {
//   @override
//   void onInit() {
//     EasyLoading.instance
//       ..indicatorType = EasyLoadingIndicatorType.rotatingCircle
//       ..loadingStyle = EasyLoadingStyle.dark
//       ..indicatorSize = 45
//       ..maskType = EasyLoadingMaskType.clear
//       ..radius = 15;
//     super.onInit();
//   }
//
//   static showLoading() {
//     EasyLoading.instance.userInteractions = false;
//
//     EasyLoading.show(
//       status: "انتظار..",
//       dismissOnTap: false,
//     );
//   }
//
//   static showError({
//     required String message,
//     int durationSeconds = 3,
//   }) {
//     EasyLoading.instance
//       ..userInteractions = true
//       ..displayDuration = Duration(seconds: durationSeconds)
//       ..errorWidget = const Icon(
//         Icons.error_outline_rounded,
//         size: 45,
//       );
//
//     EasyLoading.showError(
//       message,
//       dismissOnTap: true,
//     );
//   }
//
//   static showOfflineError() {
//     EasyLoading.instance
//       ..userInteractions = true
//       ..displayDuration = const Duration(seconds: 3)
//       ..errorWidget = const Icon(
//         Icons.wifi_off_rounded,
//         size: 45,
//       );
//
//     EasyLoading.showError(
//       "You are offline",
//       dismissOnTap: true,
//     );
//   }
//
//   static showInternalServerError({
//     EasyLoadingMaskType maskType = EasyLoadingMaskType.black,
//   }) {
//     EasyLoading.instance
//       ..userInteractions = true
//       ..displayDuration = const Duration(seconds: 3)
//       ..errorWidget = const Icon(
//         Icons.report_problem_outlined,
//         size: 45,
//       );
//
//     EasyLoading.showError(
//       "internalServerError",
//       maskType: maskType,
//       dismissOnTap: true,
//     );
//   }
//
//   static showSuccess({
//     EasyLoadingMaskType maskType = EasyLoadingMaskType.black,
//   }) {
//     EasyLoading.instance
//       ..userInteractions = true
//       ..displayDuration = const Duration(seconds: 3)
//       ..successWidget = const Icon(
//         Icons.check,
//         color: Colors.green,
//         size: 45,
//       );
//     EasyLoading.showSuccess(
//       "نجاح",
//       maskType: maskType,
//       dismissOnTap: true,
//     );
//   }
//
//   static dismiss() {
//     EasyLoading.dismiss(animation: true);
//   }
//
//   static showToast({required String message}) {
//     EasyLoading.instance
//       ..userInteractions = true
//       ..displayDuration = const Duration(seconds: 3);
//     EasyLoading.showToast(
//       message,
//       dismissOnTap: true,
//       maskType: EasyLoadingMaskType.clear,
//       toastPosition: EasyLoadingToastPosition.bottom,
//     );
//   }
// }
