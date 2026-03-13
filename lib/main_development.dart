// import 'package:flutter/material.dart';
// import 'app.dart';
// import 'core/services/localization/localization_constant.dart';
// import 'core/shared/enum/shared_enums.dart';
// import 'package:easy_localization/easy_localization.dart';
//
//
// void main() async {
//   App.flavor = Flavors.development;
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//
//   runApp(
//     EasyLocalization(
//       supportedLocales: LocalizationConstant.supportedLocales,
//       path: LocalizationConstant.localizationPath,
//       fallbackLocale: LocalizationConstant.fallbackLocale,
//       saveLocale: true,
//       useOnlyLangCode: true,
//       child: App.instance,
//     ),
//   );
// }