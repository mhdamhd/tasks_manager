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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No Data to Show`
  String get noDataToShow {
    return Intl.message(
      'No Data to Show',
      name: 'noDataToShow',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `UnExpected Error`
  String get unexpectedError {
    return Intl.message(
      'UnExpected Error',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Force Update`
  String get forceUpdate {
    return Intl.message(
      'Force Update',
      name: 'forceUpdate',
      desc: '',
      args: [],
    );
  }

  /// `App Under Maintenance`
  String get appUnderMaintenance {
    return Intl.message(
      'App Under Maintenance',
      name: 'appUnderMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Session Expired`
  String get sessionExpired {
    return Intl.message(
      'Session Expired',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Parse Error`
  String get parseError {
    return Intl.message(
      'Parse Error',
      name: 'parseError',
      desc: '',
      args: [],
    );
  }

  /// `Required Field`
  String get requiredField {
    return Intl.message(
      'Required Field',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Email Is Not Valid`
  String get emailIsNotValid {
    return Intl.message(
      'Email Is Not Valid',
      name: 'emailIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Value Is Not Valid`
  String get valueIsNotValid {
    return Intl.message(
      'Value Is Not Valid',
      name: 'valueIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Is Not Valid`
  String get mobileIsNotValid {
    return Intl.message(
      'Mobile Is Not Valid',
      name: 'mobileIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `must be at least {count}`
  String minLengthValidator(Object count) {
    return Intl.message(
      'must be at least $count',
      name: 'minLengthValidator',
      desc: '',
      args: [count],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Url Is not Valid`
  String get urlIsNotValid {
    return Intl.message(
      'Url Is not Valid',
      name: 'urlIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Value Must Be Positive`
  String get valueMustBePositive {
    return Intl.message(
      'Value Must Be Positive',
      name: 'valueMustBePositive',
      desc: '',
      args: [],
    );
  }

  /// `Password shouldn't have spaces`
  String get shouldntHaveSpaces {
    return Intl.message(
      'Password shouldn\'t have spaces',
      name: 'shouldntHaveSpaces',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `georgemichael`
  String get usernameHint {
    return Intl.message(
      'georgemichael',
      name: 'usernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `123qweASD!`
  String get passwordHint {
    return Intl.message(
      '123qweASD!',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Logged in successfully`
  String get loggedInSuccessfully {
    return Intl.message(
      'Logged in successfully',
      name: 'loggedInSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
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
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
