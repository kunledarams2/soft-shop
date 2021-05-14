import 'package:flutter/cupertino.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline6.copyWith(
            fontSize: 18.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700
          ),
        ),
        actions: [
          SvgPicture.asset(
            'logout'.svg
          ),
          SizedBox(width: 20.w,),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Container(
                width: 120.r,
                height: 120.r,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Column(
                          children: [
                            Container(
                              width: 120.r,
                              height: 120.r,
                              child: Image.asset(
                                'profile_demo'.png
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF5F2EEA),
                        radius: 16.r,
                        child: Center(
                          child: SvgPicture.asset(
                            'camera'.svg
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 20.w),
                margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: BrandColors.primaryDark
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100.w,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              '7',
                              style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              'Total Order',
                              style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w200
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 25.h,
                      width: 1.w,
                    ),
                    Container(
                      width: 100.w,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              '2,546',
                              style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              'Reviews',
                              style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w200
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F7FC),
                          borderRadius: BorderRadius.circular(10.r)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15.h,),
                            profileItem(
                              context: context,
                              icon: 'personal_info'.svg,
                              title: 'Personal Information'
                            ),
                            profileItem(
                              context: context,
                              icon: 'card'.svg,
                              title: 'Payment method'
                            ),
                            profileItem(
                              context: context,
                              icon: 'location'.svg,
                              title: 'Locations'
                            ),
                            SizedBox(height: 10.h,),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F7FC),
                          borderRadius: BorderRadius.circular(10.r)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15.h,),
                            profileItemSwitch(
                              context: context,
                              icon: 'notif'.svg,
                              title: 'Push Notification'
                            ),
                            profileItemSwitch(
                              context: context,
                              icon: 'notif'.svg,
                              title: 'SMS Notification'
                            ),
                            SizedBox(height: 10.h,),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget profileItem({BuildContext context, String icon, String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.h),
            decoration: BoxDecoration(
              color: Color(0xFF5F2EEA).withOpacity(.08),
              borderRadius: BorderRadius.circular(10.r)
            ),
            child: Container(
              width: 20.h,
              height: 20.h,
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
              ),
            )
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Text(
              '$title'
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xFFA0A3BD),
            size: 15.w,
          )
        ],
      ),
    );
  }

  Widget profileItemSwitch({BuildContext context, String icon, String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.h),
            decoration: BoxDecoration(
              color: Color(0xFF5F2EEA).withOpacity(.08),
              borderRadius: BorderRadius.circular(10.r)
            ),
            child: Container(
              width: 20.h,
              height: 20.h,
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
              ),
            )
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Text(
              '$title'
            ),
          ),
          SizedBox(
            child: PlatformSwitch(
              activeColor: BrandColors.primary,
              value: true,
              onChanged: (val){}
            ),
          )
        ],
      ),
    );
  }
}
