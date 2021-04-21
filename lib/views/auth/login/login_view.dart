import 'package:softshop_mobile/core/utils/exports.dart';

import '../../../core/utils/utils.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: Utils.statusBarPadding),
        child: Container(
          width: 1000.w,
          height: 1000.h,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 50.0,
                          ),
                          child: Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Please enter your email or phone number used to create your account',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 16.0, color: Color(0xff8B90A0)),
                        ),
                        SizedBox(height: 30.0),
                        TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.phone_iphone_outlined),
                            labelText: 'Phone or Email Address',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    fontSize: 16.0, color: Color(0xff868686)),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        CustomButton(title: 'Continue', func: () {}),
                        SizedBox(height: 120.0),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(),
                            ),
                            Text(('    Or continue using    ')),
                            Expanded(
                              child: Divider(),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 64.0,
                              width: 64.0,
                              decoration: BoxDecoration(
                                  color: BrandColors.greyE9,
                                  border: Border.all(color: Color(0xffd9dbe9)),
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          '/assets/logos/Google.png'))),
                            ),
                            Container(
                              height: 64.0,
                              width: 64.0,
                              decoration: BoxDecoration(
                                color: BrandColors.greyE9,
                                border: Border.all(color: Color(0xffd9dbe9)),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            Container(
                              height: 64.0,
                              width: 64.0,
                              decoration: BoxDecoration(
                                color: BrandColors.greyE9,
                                border: Border.all(color: Color(0xffd9dbe9)),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50.0),
                        Center(
                            child: Text(
                          'Dont have an account? Sign Up',
                          style: Theme.of(context).textTheme.bodyText1,
                        ))
                      ],
                    ),
                  ),
                ),
              ),
              SvgPicture.asset(
                'bottom'.svg,
                height: 76.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
