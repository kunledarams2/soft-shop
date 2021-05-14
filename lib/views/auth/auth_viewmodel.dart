import 'package:softshop_mobile/core/utils/exports.dart';

class AuthViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  PageController pageController = PageController();
  PageController setupAccountController = PageController();
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

  void next(PageController controller) {
    controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
  }

  void prev(PageController controller) {
    controller.previousPage(duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
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

  void navigateToSetupAccount() {
    _navigationService.navigateTo(Routes.setupAccount);
  }

  void navigateToAccountReady() {
    _navigationService.navigateTo(Routes.accountReady);
  }
}