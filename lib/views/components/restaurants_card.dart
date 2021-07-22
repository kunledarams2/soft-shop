import 'package:flutter/cupertino.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

class RestaurantsCard extends StatelessWidget {
  final String type;
  final String image;
  final String count;

  RestaurantsCard({this.type, this.image, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 151.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('restaurant'.png),
        ),
        // color: BrandColors.primary,
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Stack(
        ///How Ironic
        children: [
          Positioned(
            //padding: EdgeInsets.only(top: 10.h, left: 150.w),
            right: 25.w,
            top: 15.h,
            child: Container(
              // width: 170.w,
              // height: 30.h,
              decoration: BoxDecoration(
                color: Color(0xB35F2EEA),
                borderRadius: BorderRadius.circular(15.w),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      size: 9.r,
                      color: Color(0xFFFBFBFB),
                    ),
                    SizedBox(width: 5.5.w),
                    Text(
                      '$count $type(s) around you',
                      style: TextStyle(color: Colors.white, fontSize: 10.sp),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            //padding: EdgeInsets.only(bottom: 25.h, right: 210.w),
            left: 20.6.w,
            bottom: 18.h,
            child: Text(
              type,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
