import 'package:flutter/material.dart';
import 'package:seltle_app/core/dependency_control/get_it.dart';
import 'package:seltle_app/core/env/app_env.dart';
import 'package:seltle_app/core/storage/storage_interface.dart';
import 'package:seltle_app/features/landing_page/landing_page.dart';
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
          return MaterialApp(
            color: Colors.white,
            debugShowCheckedModeBanner: false,
            theme: lightThemeData,
            themeMode: value,
            themeAnimationCurve: Curves.fastOutSlowIn,
            themeAnimationDuration: const Duration(seconds: 1),
            darkTheme: darkTheme,
            title: 'Seltle App',
            home: const LandingPage(),
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
  await setUpInstanceLocator(flavor);
  runApp(
    MainApplication(
      currentThemeMode: locator<ThemeControl>(),
    ),
  );
}
