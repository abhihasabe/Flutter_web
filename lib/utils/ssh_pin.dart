import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:ssl_pinning_plugin/ssl_pinning_plugin.dart';

class _PiningSslData {
  String serverURL = 'set url here';
  HttpMethod httpMethod = HttpMethod.Get;
  Map<String, String> headerHttp = new Map();
  String allowedSHAFingerprint =
      'NDkgMjQgRTcgMDAgRDUgMTIgQjMgMDIgQjcgRTggN0IgRTIgQzYgRkYgQjMgNUQgNDYgN0YgMUEgQ0M=';
  int timeout = 0;
  SHA sha = SHA.SHA1;
}

class GetShaChecking {
  static _PiningSslData _data = new _PiningSslData();

  static check() async {
    try {
      await SslPinningPlugin.check(
          serverURL: _data.serverURL,
          headerHttp: _data.headerHttp,
          httpMethod: _data.httpMethod,
          sha: _data.sha,
          allowedSHAFingerprints: [
            utf8.decode(base64.decode(_data.allowedSHAFingerprint))
          ],
          timeout: _data.timeout);
    } on PlatformException {
      // throw CustomException('Connection is not secure', 800);
    }
  }
}
