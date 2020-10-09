
import 'dart:async';

import 'package:flutter/services.dart';

class EasyDynamicTheme {
  static const MethodChannel _channel =
      const MethodChannel('easy_dynamic_theme');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
