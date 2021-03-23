// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Авторизация`
  String get initial_title {
    return Intl.message(
      'Авторизация',
      name: 'initial_title',
      desc: '',
      args: [],
    );
  }

  /// `Личный Дневник`
  String get app_bar_title {
    return Intl.message(
      'Личный Дневник',
      name: 'app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Логин`
  String get text_login {
    return Intl.message(
      'Логин',
      name: 'text_login',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get text_password {
    return Intl.message(
      'Пароль',
      name: 'text_password',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get text_registr {
    return Intl.message(
      'Регистрация',
      name: 'text_registr',
      desc: '',
      args: [],
    );
  }

  /// `Вход`
  String get text_input {
    return Intl.message(
      'Вход',
      name: 'text_input',
      desc: '',
      args: [],
    );
  }

  /// `Выход`
  String get text_output {
    return Intl.message(
      'Выход',
      name: 'text_output',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}