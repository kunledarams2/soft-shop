import 'package:softshop_mobile/core/utils/exports.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1000.w,
        height: 1000.h,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  
                ),
              ),
            ),
            SvgPicture.asset(
              'bottom'.svg,
              height: 75.h,
            )
          ],
        ),
      ),
    );
  }
}