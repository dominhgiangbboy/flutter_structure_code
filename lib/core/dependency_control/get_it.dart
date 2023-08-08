import 'package:get_it/get_it.dart';
import 'package:quickcare_employee_app/core/storage/shared_preferences.dart';
import 'package:quickcare_employee_app/core/storage/storage_interface.dart';
import 'package:quickcare_employee_app/util/theme/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../env/app_env.dart';

GetIt locator = GetIt.I;

Future setUpInstanceLocator(Flavor flavor) async {
  Environment currentEnvironment = choosingEnvironment(flavor);
  locator.registerLazySingleton<Environment>(() => currentEnvironment);
  final SharedPreferences instance = await SharedPreferences.getInstance();
  locator.registerFactory<AppStorage>(() {
    return SharedPreferenceService(instance);
  });
  locator.registerFactory(() => ThemeControl(locator<AppStorage>()));
}
