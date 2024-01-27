import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) async {
    final String name =
        (locale.countryCode == null || locale.countryCode!.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    // Initialize messages based on the specified locale
    await initializeMessages(localeName);

    // Set the default locale
    Intl.defaultLocale = localeName;

    return AppLocalizations();
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Define a method to initialize messages based on the specified locale
  static Future<void> initializeMessages(String localeName) async {
    // Use a switch statement to load the appropriate messages for each supported locale
    switch (localeName) {
      case 'en':
        await findSystemLocale();
        await initializeMessages('en');
        break;
      case 'fr':
        await findSystemLocale();
        await initializeMessages('fr');
        break;
      // Add more cases for additional supported locales

      // Default case (fallback to English)
      default:
        await findSystemLocale();
        await initializeMessages('en');
        break;
    }
  }

  String get hello {
    return Intl.message('Hello', name: 'hello', desc: 'Greeting');
  }

  String get bonjour {
    return Intl.message('Bonjour', name: 'bonjour', desc: 'Greeting in French');
  }
}
