import 'package:flutter/cupertino.dart';
import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/components/order_card.dart';
import 'package:softshop_mobile/views/order/orders_view_model.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrdersViewModel>.reactive(
      onModelReady: (model) => model.getPendingOrders(),
      builder: (context, model, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Orders',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SvgPicture.asset(
                    'sort'.svg
                  )
                ],
              ),
              SizedBox(height: 10.h,),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Upcoming Orders',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6E7191),
                      ),
                    ),
                    SizedBox(height: 17.h),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.orders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OrderCard(order: model.orders[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 35.h);
                      },
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      'Completed Orders',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6E7191),
                      ),
                    ),
                    SizedBox(height: 17.h),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.orders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OrderCard(order: model.orders[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 35.h);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => OrdersViewModel(),
    );
  }
}
