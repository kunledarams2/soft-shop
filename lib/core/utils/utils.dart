

import 'package:softshop_mobile/core/utils/exports.dart';

class Utils{
  static EdgeInsets padding = EdgeInsets.only(top: MediaQuery.of(StackedService.navigatorKey.currentContext).padding.top + 40.h, left: 20.w, right: 20.w, bottom: 40.h);
  static double statusBarPadding = MediaQuery.of(StackedService.navigatorKey.currentContext).padding.top;

  static final SystemUiOverlayStyle light = Platform.isIOS ? SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark
  ) : SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light
  );

  static final SystemUiOverlayStyle dark = Platform.isIOS ? SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
  ) : SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark
  );
}