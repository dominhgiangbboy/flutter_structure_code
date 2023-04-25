import 'package:flutter/material.dart';
import 'package:flutter_default_structure/core/env/app_env.dart';

class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

Future setUpApplicationDefault(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
}
