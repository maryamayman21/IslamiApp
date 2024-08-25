import 'package:flutter/material.dart';

class SettingsLanguageProvider extends ChangeNotifier {
  String currentLag = 'ar';

  void changeAppLanguage(String newLag) {
    if (currentLag == newLag) return;
    currentLag = newLag;
    notifyListeners();
  }
}
