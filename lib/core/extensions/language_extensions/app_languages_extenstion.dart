import 'package:flutter/material.dart';
import 'package:tasksmanager/core/enums/app_languages.dart';

extension AppLanguagesExtenstions on AppLanguages {
  // TODO: Customize app button decoration properties here

  String get stringify {
    switch (this) {
      case AppLanguages.arabic:
        return 'ar';
      case AppLanguages.english:
        return 'en';
      default:
        throw "No Such Language";
    }
  }

  Locale get locale {
    switch (this) {
      case AppLanguages.arabic:
        return const Locale('ar', "SY");
      case AppLanguages.english:
        return const Locale('en', 'US');
      default:
        throw "No Such Language";
    }
  }


  }