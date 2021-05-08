import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/auth/auth_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(top: Utils.statusBarPadding),
          child: Container(
            width: 1000.w,
            height: 1000.h,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 60.h,
                          ),
                          child: Text(
                            'Forgot Password',
                            style: Theme.of(context).textTheme.headline6.copyWith(
                                fontSize: 35.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Please enter your email or phone number used to create your account',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: BrandColors.grey8B),
                        ),
                        SizedBox(height: 30.h),
                        CustomTextField(
                          labelText: 'Phone or Email Address',
                          suffixIcon: 'phone'.svg,
                        ),
                        SizedBox(height: 40.h),
                        CustomButton(title: 'Continue', func: () => model.navigateToOtp()),
                        SizedBox(height: 270.h),
                        Center(
                          child: Text(
                            'Dont have an account? Sign Up',
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'bottom'.svg,
                  height: 72.h,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget otherLoginItem({String image}) {
    return Container(
      height: 64.h,
      width: 64.h,
      decoration: BoxDecoration(
        color: BrandColors.greyE9,
        border: Border.all(color: Color(0xffd9dbe9)),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: SvgPicture.asset(image),
      ),
    );
  }
}
