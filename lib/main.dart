import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:softshop_mobile/app/router.dart';
import 'package:softshop_mobile/styles/theme/theme.dart' as _theme;
import 'core/utils/exports.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark
    )
  );
  await DotEnv.load(fileName: '.env');
  setupLogger();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        title: 'ShoftShop',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routers().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        theme: _theme.lightTheme,
        home: Container(),
      ),
    );
  }
}