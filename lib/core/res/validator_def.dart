import 'package:easy_localization/easy_localization.dart';

import '../../generated/locale_keys.g.dart';


class ValidatorDef {
  static String? validatorEmail(val) {
    if (val == null || val.isEmpty) {
      return tr(LocaleKeys.enterEmail);
    }
    if (!val.contains("@") || !val.contains(".")) {
      return tr(LocaleKeys.enterValidEmail);
    }
    return null;
  }

  static String? validatorPassword(val) {
    if (val == null || val.isEmpty ) {
      return tr(LocaleKeys.enterPassword);
    }
    else if ((val.toString()).length < 8) {
      return tr(LocaleKeys.passwordMinLength);
    }
    else if ((val.toString()).length > 15) {
      return tr(LocaleKeys.passwordMaxLength);
    }
    return null;
  }

  static String? validatorConfirmPassword(val, con) {
    if (val == null || val.isEmpty ) {
      return tr(LocaleKeys.enterPassword);
    }
    else if(val != con){
      return tr(LocaleKeys.passwordMismatch);
    }
    return null;
  }

  static String? validatorName(val) {
    if (val == null || val.isEmpty) {
      return tr(LocaleKeys.enterName);
    }
    return null;
  }

  static String? validatorLastName(val) {
    if (val == null || val.isEmpty) {
      return tr(LocaleKeys.enterLastName);
    }
    return null;
  }

  static String? validatorFatherName(val) {
    if (val == null || val.isEmpty) {
      return tr(LocaleKeys.enterFatherName);
    }
    return null;
  }

  static String? validatorPhone(val) {
    if (val == "" || val.isEmpty ) {
      return tr(LocaleKeys.enterPhone);
    }
    if ((val.toString()).length != 10) {
      return tr(LocaleKeys.invalidPhone);
    }
    return null;
  }

  static String? validatorCode(val) {
    if (val == null || val.isEmpty) {
      return tr(LocaleKeys.enterCode);
    }
    return null;
  }

  static String? validatorNumber(val) {
    if (val == "" || val.isEmpty ) {
      return tr(LocaleKeys.enterNumber);
    }
    return null;
  }

  static String? validatorParentPhone(val) {
    if (val == null || val.isEmpty) {
      return tr(LocaleKeys.enterPhone);
    }
    if ((val.toString()).length < 10) {
      return tr(LocaleKeys.invalidPhone);
    }
    return null;
  }

  static String? validatorRegion(val) {
    if (val == null || val.isEmpty) {
      return tr(LocaleKeys.selectRegion);
    }
    return null;
  }
}
