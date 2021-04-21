import 'dart:async';
import 'package:softshop_mobile/core/utils/exports.dart';

class SplashviewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Timer t;

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  void setup() {
    t = Timer(
      Duration(seconds: 5),
      () {
        _navigationService.clearStackAndShow(Routes.onboarding);
      }
    );
  }
}