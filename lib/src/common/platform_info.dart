// import 'dart:io';
// import 'devic';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import 'package:platform_info/platform_info.dart' as platforminfo;

import 'package:package_info_plus/package_info_plus.dart';
// import 'package:flutter/services.dart';

// /// Holds data that's different on Android and iOS
class PlatformInfo {
  // ignore: unused_field
  final String userAgent;
  // ignore: unused_field
  final String paystackBuild;
  // ignore: unused_field
  final String deviceId;

  static Future<PlatformInfo?> getinfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final platform = platforminfo.Platform.instance.operatingSystem;
    var mobilephoneinfo;
    if (!kIsWeb) {
      Platform.isIOS
          ? mobilephoneinfo = await DeviceInfoPlugin().iosInfo
          : Platform.isMacOS
              ? mobilephoneinfo = await DeviceInfoPlugin().macOsInfo
              : Platform.isWindows
                  ? mobilephoneinfo = await DeviceInfoPlugin().windowsInfo
                  : Platform.isLinux
                      ? mobilephoneinfo = await DeviceInfoPlugin().linuxInfo
                      : Platform.isAndroid
                          ? mobilephoneinfo =
                              await DeviceInfoPlugin().androidInfo
                          : mobilephoneinfo =
                              await DeviceInfoPlugin().deviceInfo;
    }

    String pluginVersion = packageInfo.version;
    // : Platform.instance.isIOS
    //     ? DeviceInfoPlugin().iosInfo
    //     : "NOT MOBILE";
    String deviceId = !kIsWeb ? mobilephoneinfo.toString() : "WEB";
    String userAgent = "${platform}_Paystack_$pluginVersion";
    return PlatformInfo._(
      userAgent: userAgent,
      paystackBuild: pluginVersion,
      deviceId: deviceId,
    );
  }

  PlatformInfo._({
    required this.userAgent,
    required this.paystackBuild,
    required this.deviceId,
  });

  @override
  String toString() {
    return '[userAgent = $userAgent, paystackBuild = $paystackBuild, deviceId = $deviceId]';
  }
}
