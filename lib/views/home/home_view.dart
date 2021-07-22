import 'package:flutter/cupertino.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

import '../components/restaurants_card.dart';
import '../components/store_card.dart';

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
                                  .copyWith(
                                      color: BrandColors.primary,
                                      fontSize: 16.sp),
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
                          SizedBox(
                            width: 20.w,
                          ),
                          StoreCard(image: 'store2'),
                          SizedBox(
                            width: 20.w,
                          ),
                          StoreCard(image: 'store1'),
                          SizedBox(
                            width: 20.w,
                          ),
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
