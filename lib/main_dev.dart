import 'package:logger/logger.dart';

import 'core/env/app_env.dart';
import 'main_application.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);
void main() {
  setUpApplicationDefault(
    Flavor.dev,
  );
}
