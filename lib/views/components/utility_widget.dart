import 'package:fluttertoast/fluttertoast.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

class CustomToast {
  static void show(String msg) => Fluttertoast.showToast(
      msg: msg ?? "Toast message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.sp);

  static void cancelAll() => Fluttertoast.cancel();
}


BottomNavigationBarItem bottomBarItem(String name, String path, String semanticlabel, String activeSemanticLabel, int cIndex, int index, BuildContext context) {
  return BottomNavigationBarItem(
    title: AnimatedContainer(
      margin: EdgeInsets.only(top: 1.h),
      duration: const Duration(milliseconds: 200),
      child: Text(
        '$name',
        style: Theme.of(context).textTheme.headline4.copyWith(
          fontSize: 12.sp,
          fontWeight: cIndex == index ? FontWeight.w500 : FontWeight.w500,
          color: cIndex == index ? BrandColors.primary : Colors.black.withOpacity(.3)
        ),
      ),
    ),
    icon: SvgPicture.asset(
      path,
      height: 35.h,
      width: 35.h,
      color: Colors.black.withOpacity(.3),
      semanticsLabel: semanticlabel,
      fit: BoxFit.fill,
    ),
    activeIcon: SvgPicture.asset(
      path,
      height: 35.h,
      width: 35.h,
      color: BrandColors.primary,
      semanticsLabel: activeSemanticLabel
    ),
  );
}