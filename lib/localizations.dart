import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  late Map<String, String> _localizedStrings;

  AppLocalizations(Locale locale) {
    _localizedStrings = <String, String>{};
  }

  Future<bool> load() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/intl_messages.arb');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings =
          jsonMap.map((key, value) => MapEntry(key, value.toString()));
      return true;
    } catch (e) {
      print('Error loading localization: $e');
      return false;
    }
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
