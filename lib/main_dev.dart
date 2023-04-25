import 'package:flutter/widgets.dart';

import 'core/env/app_env.dart';
import 'main_application.dart';

Future main() async {
  await setUpApplicationDefault(
    Flavor.dev,
  );
  runApp(
    const MainApplication(),
  );
}
