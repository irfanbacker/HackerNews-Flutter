import 'dart:io';
import 'package:flutter/foundation.dart';

class PlatformDevice {
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isWeb => kIsWeb;
  static bool get isDesktop =>
      Platform.isLinux || Platform.isMacOS || Platform.isWindows;
  static bool get isLinux => Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isWindows => Platform.isWindows;
}
