import 'package:flutter/material.dart';
import 'package:seltle_app/core/dependency_control/get_it.dart';
import 'package:seltle_app/util/theme/theme_data.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(onPressed: () {
        locator<ThemeControl>().changeMode(ThemeMode.dark);
      }),
      body: Center(
        child: Text('Landing Page'),
      ),
    );
  }
}
