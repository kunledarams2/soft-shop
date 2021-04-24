import 'package:softshop_mobile/core/utils/exports.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('home'.svg), label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('search_bar'.svg), label: 'Search'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('orders'.svg), label: 'Orders'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('profile'.svg), label: 'Profile'),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Hi, Adeleke!',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 30.sp, color: Colors.black),
                      ),
                    ),
                    Text(
                      'What would you like to get today? 😀',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 15.sp, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(width: 20.w),
                Container(
                  width: 60.w,
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
            Container(
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                color: BrandColors.greyD9,
                borderRadius: BorderRadius.circular(15.w),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Search for a Restauruant'),
                    SvgPicture.asset('search'.svg)
                  ],
                ),
              ),
            ),
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
                        .copyWith(fontSize: 18.sp),
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: BrandColors.primary, fontSize: 16.sp),
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
                  StoreCard(image: 'store2'),
                  StoreCard(image: 'store1'),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Marketplace',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: 10.h),
            Column(
              children: [
                RestaurantsCard(type: 'Restaurant', count: '8'),
                RestaurantsCard(type: 'Store', count: '5'),
                RestaurantsCard(type: 'Restaurant', count: '3'),
              ],
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
      height: 150.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('restaurant'.png),
        ),
        // color: BrandColors.primary,
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 150.w),
            child: Container(
              width: 170.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: Color(0xB35F2EEA),
                borderRadius: BorderRadius.circular(15.w),
              ),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    SvgPicture.asset(image.svg),
                    Text(
                      '$count $type(s) around you',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25.h, right: 210.w),
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
      width: 138.w,
      height: 138.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image.png),
        ),
        // color: BrandColors.primary,
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
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
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
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}