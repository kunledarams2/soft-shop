import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softshop_mobile/views/auth/login/login_view.dart';
import 'package:softshop_mobile/views/onboarding/onboarding_view.dart';

abstract class Routes {
  static const main = '/main';
  static const onboarding = '/onboarding';
  static const login = '/login';
}

class Routers {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => Container(), settings: settings);
      case Routes.onboarding:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => OnboardingView(), settings: settings);
      case Routes.login:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => LoginView(), settings: settings);
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
