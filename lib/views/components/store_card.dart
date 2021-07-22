import 'package:flutter/cupertino.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

class StoreCard extends StatelessWidget {
  final String image;

  StoreCard({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 138.r,
      height: 138.r,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image.png),
        ),
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.only(left: 35.w, top: 5.h),
              child: Container(
                width: 75.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Color(0xB35F2EEA),
                  borderRadius: BorderRadius.circular(15.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('clock'.svg),
                      Text(
                        '45-55 min',
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Ginnie's Kitchen",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
