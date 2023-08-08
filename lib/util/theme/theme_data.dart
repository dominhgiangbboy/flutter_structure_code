import 'package:flutter/material.dart';
import 'package:quickcare_employee_app/core/storage/storage_interface.dart';
import 'package:quickcare_employee_app/util/colors.dart';

final ThemeData lightThemeData = ThemeData(
  colorScheme: const ColorScheme(
    primary: AppColors.primaryColorLight,
    secondary: AppColors.secondaryColorLight,
    background: AppColors.backgroundColorLight,
    surface: AppColors.cardColorLight,
    error: AppColors.statusColorError,
    onPrimary: AppColors.primaryTextColorLight,
    onSecondary: AppColors.secondaryTextColorLight,
    onSurface: AppColors.cardTextColorLight,
    onBackground: AppColors.backgroundTextColorLight,
    onError: AppColors.statusColorText,
    brightness: Brightness.light,
  ),
);
final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: AppColors.primaryColorDark,
    secondary: AppColors.secondaryColorDark,
    background: AppColors.backgroundColorDark,
    surface: AppColors.cardColorDark,
    error: AppColors.statusColorError,
    onPrimary: AppColors.primaryTextColorDark,
    onSecondary: AppColors.secondaryTextColorDark,
    onSurface: AppColors.cardTextColorDark,
    onBackground: AppColors.backgroundTextColorDark,
    onError: AppColors.statusColorText,
    brightness: Brightness.dark,
  ),
);

class ThemeControl extends ChangeNotifier {
  ThemeControl(this.storage) {
    themeModeNotifier.value = storage.themeMode;
  }

  final AppStorage storage;
  static ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);
  changeMode() {
    if (themeModeNotifier.value == ThemeMode.dark) {
      storage.themeMode = ThemeMode.light;
      themeModeNotifier.value = ThemeMode.light;
    } else {
      storage.themeMode = ThemeMode.dark;
      themeModeNotifier.value = ThemeMode.dark;
    }
  }
}
