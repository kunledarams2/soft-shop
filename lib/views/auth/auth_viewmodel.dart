import 'package:softshop_mobile/core/utils/exports.dart';

class AuthViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  PageController pageController = PageController();
  int page = 0;
  bool showLoginPassword = false;

  TextEditingController pinController = TextEditingController();

  void setShowLoginPassword() {
    showLoginPassword = !showLoginPassword;
    notifyListeners();
  }

  void setPage(int val) {
    page = val;
    notifyListeners();
  }

  void next() {
    pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
  }

  void prev() {
    pageController.previousPage(duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
  }

  void navigateToMain() {
    _navigationService.clearStackAndShow(Routes.main);
  }

  void navigateToLogin() {
    _navigationService.clearStackAndShow(Routes.auth);
  }

  void navigateToOtp() {
    _navigationService.navigateTo(Routes.verifyOtp);
  }

  void navigateToNewPassword() {
    _navigationService.navigateTo(Routes.newPassword);
  }
}