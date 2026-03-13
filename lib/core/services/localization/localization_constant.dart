import 'dart:ui';

class LocalizationConstant {
  static List<Locale> supportedLocales = [
    Locale('ar'),
    Locale('en'),
  ];
  static String localizationPath = "assets/translation";
  static Locale fallbackLocale = Locale("en");
}