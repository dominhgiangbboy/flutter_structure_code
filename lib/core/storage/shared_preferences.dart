import 'package:flutter/material.dart';
import 'package:seltle_app/core/storage/storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService implements AppStorage {
  final SharedPreferences instance;
  SharedPreferenceService(this.instance);

  static ThemeMode getThemeMode(int index) {
    switch (index) {
      case 0:
        return ThemeMode.system;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static int returnThemeModeStatusCode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return 0;
      case ThemeMode.light:
        return 1;
      case ThemeMode.dark:
        return 2;
      default:
        return 0;
    }
  }

  @override
  ThemeMode get themeMode {
    int value = instance.getInt('themeMode') ?? 0;
    return getThemeMode(value);
  }

  @override
  set themeMode(ThemeMode value) {
    instance.setInt('themeMode', returnThemeModeStatusCode(value));
  }
}
