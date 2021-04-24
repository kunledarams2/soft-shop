import 'package:softshop_mobile/core/utils/exports.dart';

class RestaurantsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
        backgroundColor: BrandColors.primary,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SvgPicture.asset(
              'search'.svg,
              width: 18.w,
              height: 20.h,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivering to'),
                    SizedBox(height: 5.h),
                    Text(
                      'B1 Riverview Terrace 8 Sunflower T...',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SvgPicture.asset('ellipse'.svg)
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Around You',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RestaurantCard(
                  name: 'Buttermilk Restaurant',
                  image: 'buttermilk_restaurant_1',
                  rating: '4.1',
                ),
                RestaurantCard(
                  name: 'Buttermilk Restaurant',
                  image: 'buttermilk_restaurant_2',
                  rating: '4.1',
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RestaurantCard(
                  name: "Mimie's Kitchen",
                  image: 'mimies_kitchen',
                  rating: '4.1',
                ),
                RestaurantCard(
                  name: 'Buttermilk Restaurant',
                  image: 'buttermilk_restaurant_3',
                  rating: '4.1',
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RestaurantCard(
                  name: 'Buttermilk Restaurant',
                  image: 'buttermilk_restaurant_4',
                  rating: '4.1',
                ),
                RestaurantCard(
                  name: 'Buttermilk Restaurant',
                  image: 'buttermilk_restaurant_5',
                  rating: '4.1',
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RestaurantCard(
                  name: 'Buttermilk Restaurant',
                  image: 'buttermilk_restaurant_1',
                  rating: '4.1',
                ),
                RestaurantCard(
                  name: 'Buttermilk Restaurant',
                  image: 'buttermilk_restaurant_2',
                  rating: '4.1',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final String image;
  final String rating;

  const RestaurantCard({this.name, this.image, this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.w,
      height: 178.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image.png),
        ),
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
            SizedBox(height: 10.h),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('star'.svg),
                    SizedBox(width: 10.w),
                    Text(
                      '$rating (2,527)',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('clock2'.svg),
                    SizedBox(width: 10.w),
                    Text(
                      '30-60 min',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
