import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickcare_employee_app/main_application.dart';
import 'package:quickcare_employee_app/util/theme/theme_data.dart';

void main() {
  group("Main application test widget:", () {
    testWidgets('UI testing', (tester) async {
      // await tester.pumpWidget(const MainApplication(
      //   currentThemeMode: ThemeControl,
      // ));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final titleFinderMaterialApp = find.byType(MaterialApp);

      expect(titleFinderMaterialApp, findsOneWidget);
      titleFinderMaterialApp.evaluate().forEach((element) {
        final MaterialApp materialApp = element.widget as MaterialApp;
        expect(materialApp.title, 'Seltle App');
        expect(materialApp.color, Colors.white);
        expect(materialApp.themeMode, ThemeMode.light);
        expect(materialApp.debugShowCheckedModeBanner, false);
      });
    });
  });
}
