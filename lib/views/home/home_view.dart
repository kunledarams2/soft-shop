import 'package:flutter/cupertino.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        padding: EdgeInsets.only(top: Utils.statusBarPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 24.h),
                      child: Text(
                        'Hi, Adeleke!',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 25.sp, color: Colors.black),
                      ),
                    ),
                    Text(
                      'What would you like to get today? 😀',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(width: 20.w),
                Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: BrandColors.primary,
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('cart'.svg),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          '2',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Colors.white, fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              hintText: 'Search for a Restaurant',
              rounded: true,
              suffixIcon: 'search'.svg,
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Stores Around You',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 16.sp),
                          ),
                          GestureDetector(
                            child: Text(
                              'See All',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: BrandColors.primary, fontSize: 16.sp),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/restaurants');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StoreCard(image: 'store1'),
                          SizedBox(width: 20.w,),
                          StoreCard(image: 'store2'),
                          SizedBox(width: 20.w,),
                          StoreCard(image: 'store1'),
                          SizedBox(width: 20.w,),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        'Marketplace',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ListView.separated(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return RestaurantsCard(type: 'Restaurant', count: '8');
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 16.h);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
            right: 10.5.w,
            top: 8.h,
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
              padding: EdgeInsets.only(left: 35.w),
              child: Container(
                width: 85.w,
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
