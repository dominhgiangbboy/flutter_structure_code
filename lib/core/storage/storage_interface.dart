import 'package:flutter/material.dart';

abstract class AppStorage {
  ThemeMode get themeMode;
  set themeMode(ThemeMode value);
}
