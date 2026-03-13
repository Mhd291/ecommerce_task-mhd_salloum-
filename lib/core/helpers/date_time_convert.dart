import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../generated/locale_keys.g.dart';

String timeAgoOrFormatted(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);


  if (diff.isNegative) {
    final ahead = diff.abs();

    if (ahead.inMinutes < 1) return tr(LocaleKeys.inMoments);
    if (ahead.inMinutes < 60) return tr(LocaleKeys.inMinutes, args: ['${ahead.inMinutes}']);
    if (ahead.inHours < 24) return tr(LocaleKeys.inHours, args: ['${ahead.inHours}']);
    if (ahead.inDays == 1) return tr(LocaleKeys.tomorrow);
    return DateFormat('yyyy / MM / dd').format(date);
  }


  if (diff.inSeconds < 60) return tr(LocaleKeys.now);
  if (diff.inMinutes == 1) return tr(LocaleKeys.minuteAgo);
  if (diff.inMinutes < 60) return tr(LocaleKeys.minutesAgo, args: ['${diff.inMinutes}']);
  if (diff.inHours == 1) return tr(LocaleKeys.hourAgo);
  if (diff.inHours < 24) return tr(LocaleKeys.hoursAgo, args: ['${diff.inHours}']);
  if (diff.inDays == 1) return tr(LocaleKeys.yesterday);
  if (diff.inDays < 7) return tr(LocaleKeys.daysAgo, args: ['${diff.inDays}']);


  return DateFormat('yyyy / MM / dd').format(date);
}
