import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DemoLocalization {
  final Locale locale;

  DemoLocalization(this.locale);
  static DemoLocalization of(BuildContext context) {
    return Localizations.of<DemoLocalization>(context, DemoLocalization);
  }

  Map<String, String> _localizationValues;

  Future load() async {
    String jsonStringValue =
        await rootBundle.loadString('lib/lang/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValue);

    _localizationValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValue(String key) => _localizationValues[key];

  static const LocalizationsDelegate<DemoLocalization> delegate =
      _DemoLocalizationDelegate();
}

class _DemoLocalizationDelegate
    extends LocalizationsDelegate<DemoLocalization> {
  const _DemoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'fa', 'ar', 'hi'].contains(locale.languageCode);

  @override
  Future<DemoLocalization> load(Locale locale) async {
    DemoLocalization localization = new DemoLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DemoLocalization> old) =>
      false;
}
