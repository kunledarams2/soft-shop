import 'package:flutter/cupertino.dart';
import 'package:softshop_mobile/core/utils/exports.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      //   actions: [
      //     Icon(Icons.logout),
      //   ],
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 56.h),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20.w),
          //   child: Row(
          //     children: [
          //       SizedBox(width: 128.w),
          //       Text(
          //         'Profile',
          //         style: TextStyle(fontSize: 16.sp),
          //       ),
          //       SizedBox(width: 123.w),
          //       Icon(Icons.logout),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
