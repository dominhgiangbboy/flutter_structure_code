import 'package:flutter/material.dart';
import 'package:seltle_app/core/dependency_control/get_it.dart';
import 'package:seltle_app/util/theme/theme_data.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color backgroundColor = colorScheme.background;
    final Color backgroudButtonColor = colorScheme.primary;
    final Color onButtonColor = colorScheme.onPrimary;
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
          backgroundColor: backgroudButtonColor,
          onPressed: () {
            locator<ThemeControl>().changeMode();
          },
          child: Icon(
            Icons.add,
            color: onButtonColor,
          )),
      body: const Center(
        child: Text('Landing Page'),
      ),
    );
  }
}
