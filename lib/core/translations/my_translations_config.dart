import 'package:get/get.dart';
import 'package:store_ads/core/translations/ar_sy.dart';
import 'package:store_ads/core/translations/en_us.dart';

class MyTranslationsConfig extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ar_AE': arSY,
      };
}
