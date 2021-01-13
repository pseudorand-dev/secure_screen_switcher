import 'dart:async';

import 'package:flutter/services.dart';

class SecureScreenSwitcher {
  static const MethodChannel _channel =
      const MethodChannel('secure_screen_switcher');

  /// Turn on the app screen security
  ///
  /// on iOS this makes the screen black in the app switcher screen
  /// On Android this makes the screen black in the app switcher screen and blocks screenshots in addition
  static Future<bool> secureApp() async {
    try {
      bool success = await _channel.invokeMethod('secure_app');
      return success;
    } catch (e) {
      print(
          "an error occurred while trying to setup the flutter_secure_app: ${e.toString()}");
      return false;
    }
  }
}
