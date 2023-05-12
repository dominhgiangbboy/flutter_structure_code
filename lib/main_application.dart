import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seltle_app/core/dependency_control/get_it.dart';
import 'package:seltle_app/core/env/app_env.dart';
import 'package:seltle_app/core/routers/routers.dart';
import 'package:seltle_app/util/theme/theme_data.dart';

class MainApplication extends StatefulWidget {
  final ThemeControl currentThemeMode;

  const MainApplication({
    required this.currentThemeMode,
    super.key,
  });

  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ThemeControl.themeModeNotifier,
        builder: (context, value, child) {
          return MaterialApp.router(
            color: Colors.white,
            debugShowCheckedModeBanner: false,
            theme: lightThemeData,
            themeMode: value,
            themeAnimationCurve: Curves.fastOutSlowIn,
            themeAnimationDuration: const Duration(seconds: 1),
            darkTheme: darkTheme,
            title: 'Seltle App',
            routerConfig: router,
          );
        });
  }
}

/// Cached default settings for the application
class DefaultAppSettings {
  final ThemeMode currentThemeMode;
  const DefaultAppSettings({
    required this.currentThemeMode,
  });
}

Future setUpApplicationDefault(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setUpInstanceLocator(flavor);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vn', 'VN')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      useFallbackTranslations: true,
      child: MainApplication(
        currentThemeMode: locator<ThemeControl>(),
      ),
    ),
  );
}
