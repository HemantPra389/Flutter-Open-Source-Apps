import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeManager() : _currentThemeMode = ThemeMode.dark;
  ThemeMode _currentThemeMode;

  get currentThemeMode => _currentThemeMode;

  void changeTheme(ThemeMode newThemeMode) {
    _currentThemeMode = newThemeMode;
    notifyListeners();
  }
}
