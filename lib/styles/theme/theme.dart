import 'package:flutter/cupertino.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: createMaterialColor(BrandColors.light),
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  fontFamily: 'Roboto',
  iconTheme: IconThemeData(
    color: Colors.white
  ),
  // floatingActionButtonTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

ThemeData lightTheme = ThemeData(
  primarySwatch: createMaterialColor(BrandColors.primary_dark),
  primaryColor: BrandColors.primary_dark,
  brightness: Brightness.light,
  backgroundColor: BrandColors.light,
  scaffoldBackgroundColor: BrandColors.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    elevation: 0,
    brightness: Brightness.light,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  // textTheme: TextTheme(
  //   headline4: TextStyle().copyWith(color: BrandColors.grey),
  // ),
  primaryTextTheme: TextTheme(
    headline6: TextStyle().copyWith(color: Colors.black, fontWeight: FontWeight.w600,)
  ),
  iconTheme: IconThemeData(
    color: Colors.black
  ),
  fontFamily: 'Roboto',
  dividerColor: Colors.black12,
  cardColor: Colors.white54
  // accentColor: Colors.black,
  // accentIconTheme: IconThemeData(color: Colors.white),
  // dividerColor: Colors.black,
);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}