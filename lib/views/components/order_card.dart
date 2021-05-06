import 'package:softshop_mobile/core/models/order.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  OrderCard({this.order});

  String _getStatusFromCode(int statusCode) {
    switch (statusCode) {
      case 0:
        return 'Completed';
      case 1:
        return 'Order failed';
      case 2:
        return 'Delivering';
      case 3:
        return 'Placing order';
      default:
        return 'Unknown Error';
    }
  }

  Color _getTextColorFromCode(int statusCode) {
    switch (statusCode) {
      case 0:
        return Color(0xFF00BA88);
      case 1:
        return Color(0xFFED2E2E);
      case 2:
        return Color(0xFF00BA88);
      case 3:
        return Color(0xFFF4B740);
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                Container(
                  height: 64.r,
                  width: 64.r,
                  decoration: BoxDecoration(
                    color: BrandColors.primary,
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('store2'.png),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cera Pro',
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Quantity',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cera Pro',
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          order.quantity.toString(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Cera Pro',
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cera Pro',
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'NGN7,500',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: BrandColors.primary,
                            fontFamily: 'Cera Pro',
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Status: ',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cera Pro',
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: _getStatusFromCode(order.statusCode),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Cera Pro',
                              color: _getTextColorFromCode(order.statusCode),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30.r,
          width: 30.r,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: BrandColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
            ),
            child: Icon(
              Icons.add,
              size: 14.r,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
