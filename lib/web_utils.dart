// notification_permission_web.dart
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show debugPrint;

Future<void> requestNotificationPermission() async {
  final permission = await html.window.navigator.permissions?.query({'name': 'notifications'});
  if (permission?.state != 'granted') {
    final result = await html.Notification.requestPermission();
    if (result != 'granted') {
      // Handle the case where the user denies the permission
      print('Notification permission denied');
    }
  }
}

Future<bool> writeFile(String data) async {
  try {
    final blob = html.Blob([data], 'text/plain', 'native');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'momoBackup_${DateTime.now().millisecondsSinceEpoch}.json')
      ..click();
    html.Url.revokeObjectUrl(url);
    return true;
  } catch (e) {
    debugPrint('Error writing file: $e');
    return false;
  }
}