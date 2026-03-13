import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;

    return DropdownButton<Locale>(
      value: currentLocale,
      dropdownColor: Colors.black.withOpacity(0.5),
      underline: const SizedBox(),
      iconEnabledColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      items: context.supportedLocales.map((locale) {
        final name = locale.languageCode == 'ar' ? 'العربية' : 'English';
        return DropdownMenuItem(
          value: locale,
          child: Text(name),
        );
      }).toList(),
      onChanged: (locale) async {
        if (locale != null) {
          await context.setLocale(locale);
        }
      },
    );
  }
}
