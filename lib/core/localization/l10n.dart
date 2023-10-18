import 'package:flutter/material.dart';

class L10n {
  L10n._();

  static final all = [
    const Locale('en'),
    const Locale('np'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'np':
        return 'Nepali';
      case 'en':
      default:
        return 'English';
    }
  }
}
