import 'package:flutter/cupertino.dart';
import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/components/order_card.dart';
import 'package:softshop_mobile/views/home/orders_view_model.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrdersViewModel>.reactive(
      disposeViewModel: false,
      onModelReady: (model) => model.getPendingOrders(),
      builder: (context, model, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Orders',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.menu),
                ],
              ),
              SizedBox(height: 31.h),
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
                physics: ClampingScrollPhysics(),
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
                physics: ClampingScrollPhysics(),
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
        );
      },
      viewModelBuilder: () => locator<OrdersViewModel>(),
    );
  }
}
