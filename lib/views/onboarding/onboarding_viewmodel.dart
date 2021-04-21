import 'package:softshop_mobile/core/utils/exports.dart';

class OnboardingViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  PageController pageController = PageController();
  int page = 0;

  void setPage(int val) {
    page = val;
    notifyListeners();
  }

  void next() {
    // page = val;
    // notifyListeners();
    pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
  }

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.login);
  }
}