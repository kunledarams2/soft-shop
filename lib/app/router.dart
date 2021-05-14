import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softshop_mobile/views/auth/account_ready.dart';
import 'package:softshop_mobile/views/auth/auth_view.dart';
import 'package:softshop_mobile/views/auth/login_view.dart';
import 'package:softshop_mobile/views/auth/forgotPassword_view.dart';
import 'package:softshop_mobile/views/auth/new_password_view.dart';
import 'package:softshop_mobile/views/auth/otp_view.dart';
import 'package:softshop_mobile/views/auth/setup_account_holder.dart';
import 'package:softshop_mobile/views/home/restaurants_view.dart';
import 'package:softshop_mobile/views/main/main_view.dart';
import 'package:softshop_mobile/views/onboarding/onboarding_view.dart';

abstract class Routes {
  static const main = '/main';
  static const auth = '/auth';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const forgotPass = '/forgotPass';
  static const restaurants = '/restaurants';
  static const verifyOtp = '/verifyOtp';
  static const newPassword = '/newPassword';
  static const setupAccount = '/setupAccount';
  static const accountReady = '/accountReady';
}

class Routers {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => MainView(), 
          settings: settings
        );
      case Routes.auth:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => AuthView(), 
            settings: settings);
      case Routes.onboarding:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => OnboardingView(),
            settings: settings);
      case Routes.login:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => LoginView(),
            settings: settings);
      case Routes.forgotPass:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => ForgotPasswordView(),
            settings: settings);
      case Routes.restaurants:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => RestaurantsView(),
            settings: settings);
      case Routes.verifyOtp:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => OtpView(),
            settings: settings);
      case Routes.newPassword:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => NewPasswordView(),
            settings: settings);
      case Routes.setupAccount:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => SetupAccountHolder(),
            settings: settings);
      case Routes.accountReady:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => AccountReady(),
            settings: settings);
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// borrowed from auto_route:
// returns an error page routes with a helper message.
PageRoute unknownRoutePage(String routeName) => CupertinoPageRoute(
      builder: (ctx) => Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  routeName == "/"
                      ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                      : 'Route name $routeName is not found!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              OutlinedButton.icon(
                label: Text('Back'),
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ),
      ),
    );
