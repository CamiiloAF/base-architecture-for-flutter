import 'dart:convert';

import 'package:flutter/services.dart';

/// Initialize environment config.
///
/// Also you can get the environment variables
///
/// You must be creates "config" folder in the root project. Inside, you create
/// app_config.dev.json (.dev can be replaced with your environment)
/// to declare your environment variables.
abstract class ConfigEnvironments {
  /// If you need expose current environment else, you can delete this variable
  static String? currentEnvironment;
  static late Map<String, dynamic> _config;

  /// Initialize configs
  static Future<void> initialize({required final String env}) async {
    currentEnvironment = env;
    await _configApp(env);
  }

  static Future<void> _configApp(final String env) async {
    final configString =
        await rootBundle.loadString('config/app_config.$env.json');

    _config = json.decode(configString) as Map<String, dynamic>;
  }

  /// Get API URL
  ///
  /// Replicate this method to get other environment variables that you define
  /// into [_config]
  static String getApiHostAws() {
    return _config['API_HOST_AWS'] as String;
  }
}
