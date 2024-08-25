import 'package:flutter/material.dart';

class SettingsThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  bool switchState = false;
  void changeAppTheme(ThemeMode newTheme, bool newState) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    switchState = newState;
    notifyListeners();
  }

  String getBackgroundImageTheme() {
    return currentTheme == ThemeMode.light
        ? 'main_background.png'
        : 'main_background_dark.png';
  }

  String getSebhaHeadTheme() {
    return currentTheme == ThemeMode.light
        ? 'head of seb7a.png'
        : 'head of seb7a_dark.png';
  }

  String getSebhaBodyTheme() {
    return currentTheme == ThemeMode.light
        ? 'body of seb7a.png'
        : 'body of seb7a_dark.png';
  }

  String getPlayRadioButtonTheme() {
    return currentTheme == ThemeMode.light
        ? 'play_radio_light.png'
        : 'play_radio_dark.png';
  }
}
