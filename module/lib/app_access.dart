import 'dart:async';

import 'package:flutter/services.dart';

class AppAccess {
  static const MethodChannel _channel =
      const MethodChannel('flutter/appaccess');

  static Future<bool> get isRooted async {
    final bool value = await _channel.invokeMethod('checkAccess');
    return value;
  }

  static Future<String> getSignature(String value) async {
    final String values =
        await _channel.invokeMethod('getSignature', {'value': value});
    return values;
  }

  static Future<String> encrypt(String value, String mainText) async {
    final String values = await _channel
        .invokeMethod('encrypt_data', {'value': value, 'maintext': mainText});
    return values;
  }

  static Future<String> decrypt(String value, String mainText) async {
    final String values = await _channel
        .invokeMethod('decrypt_data', {'value': value, 'maintext': mainText});
    return values;
  }
}
