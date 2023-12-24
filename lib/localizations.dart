import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io' show FileSystemException;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  Map<String, String>? _localizedStrings;

  AppLocalizations(Locale locale) {
    final supportedLocale = _isLocaleSupported(locale)
        ? locale
        : const Locale('en'); // ou outro idioma padrão

    _load(supportedLocale);
  }

  Future<void> _load(Locale locale) async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/intl_messages.arb');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings = Map<String, String>.from(
          jsonMap.map((key, value) => MapEntry(key, value.toString())));
    } catch (e, stackTrace) {
      if (e is FormatException) {
        // Lida com erro de formato inválido
      } else if (e is FileSystemException) {
        // Lida com erro de sistema de arquivos
      } else {
        // Outros erros
        developer.log('Error loading localization',
            error: e, stackTrace: stackTrace);
      }
      _localizedStrings = null;
    }
  }

  Future<bool> load(Locale locale) async {
    try {
      await _load(locale);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool _isLocaleSupported(Locale locale) {
    return ['en', 'pt'].contains(locale.languageCode);
  }

  String translate(String key) {
    return _localizedStrings?.containsKey(key) == true
        ? _localizedStrings![key]!
        : '[$key]';
  }

  String translateLevel(String level) {
    switch (level) {
      case 'Beginner':
        return 'Iniciante';
      case 'Intermediate':
        return 'Intermediário';

      default:
        return level;
    }
  }

  String translateVocabularyLearning(String level) {
    return translate('vocabulary_learning_${translateLevel(level)}');
  }

  String translateVocabularyScreen(String level) {
    return translate('vocabulary_screen_${translateLevel(level)}');
  }

  String translateWord(String word) {
    return translate('word_$word');
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
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
