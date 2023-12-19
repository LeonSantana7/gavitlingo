import 'package:flutter/material.dart';

class AppLocalizations {
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'hello': 'Hello',
      // outras mensagens em inglês...
    },
    'pt': {
      'hello': 'Olá',
      // outras mensagens em português...
    },
    // adicione mais idiomas conforme necessário...
  };

  static String? of(BuildContext context, String key) {
    // Recupere o código do idioma atual
    final locale = Localizations.localeOf(context).languageCode;

    // Verifique se a chave está presente no idioma atual
    if (_localizedValues[locale]?.containsKey(key) ?? false) {
      return _localizedValues[locale]![key];
    }

    // Se a chave não estiver presente, retorne a chave como padrão
    return key;
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
    return AppLocalizations();
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
