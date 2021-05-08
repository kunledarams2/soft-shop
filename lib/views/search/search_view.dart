import 'package:flutter/cupertino.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 24.h,
              ),
              child: Text(
                'Search',
                style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: 24.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                color: BrandColors.greyE9,
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      SvgPicture.asset('search'.svg),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          'Search on Softshop',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Color(0xff868686), fontSize: 16.sp),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 26.h),
            Text(
              'Top stores',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 26.h),
            Column(
              children: [
                SearchRestaurantCard(
                  name: 'ButterMilk Restaurant',
                  address: '3517 W. Gray St. Utica, Pennsylvania 57867.',
                  image: 'search_store1',
                  rating: '5.5',
                ),
                SearchRestaurantCard(
                  name: 'ButterMilk Restaurant',
                  address: '3517 W. Gray St. Utica, Pennsylvania 57867.',
                  image: 'search_store2',
                  rating: '3.1',
                ),
                SearchRestaurantCard(
                  name: 'ButterMilk Restaurant',
                  address: '3517 W. Gray St. Utica, Pennsylvania 57867.',
                  image: 'search_store3',
                  rating: '4.5',
                ),
                SearchRestaurantCard(
                  name: 'ButterMilk Restaurant',
                  address: '3517 W. Gray St. Utica, Pennsylvania 57867.',
                  image: 'search_store4',
                  rating: '4.2',
                ),
                SearchRestaurantCard(
                  name: 'ButterMilk Restaurant',
                  address: '3517 W. Gray St. Utica, Pennsylvania 57867.',
                  image: 'search_store2',
                  rating: '4.7',
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}

class SearchRestaurantCard extends StatelessWidget {
  final String name;
  final String address;
  final String image;
  final String rating;

  const SearchRestaurantCard(
      {this.name, this.address, this.image, this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.r,
          height: 100.r,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image.png),
            ),
            // color: BrandColors.primary,
            borderRadius: BorderRadius.circular(15.w),
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1.h),
              Text(
                address,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 12.sp),
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  SvgPicture.asset('star'.svg),
                  SizedBox(width: 5.w),
                  Text(
                    '$rating (2,567)',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(width: 5.w),
                  SvgPicture.asset('fast-delivery'.svg),
                  SizedBox(width: 5.w),
                  Text(
                    '20-30 min',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 17.w),
        SizedBox(
          height: 30.r,
          width: 30.r,
          child: TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: BrandColors.primary,
            ),
            onPressed: () {},
            child: Icon(CupertinoIcons.chevron_right,
                color: Colors.white, size: 15.r),
          ),
        ),
        // SvgPicture.asset('search_screen_icon'.svg)
      ],
    );
  }
}
