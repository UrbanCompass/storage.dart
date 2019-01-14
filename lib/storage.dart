import 'dart:async';

import 'package:flutter/services.dart';

class Storage {
  static const MethodChannel _channel =
      const MethodChannel('storage');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
