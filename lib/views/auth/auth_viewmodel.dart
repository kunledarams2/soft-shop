import 'package:softshop_mobile/core/utils/exports.dart';

class AuthViewModel extends BaseViewModel {
  PageController pageController = PageController();
  int page = 0;
  bool showLoginPassword = false;

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
}