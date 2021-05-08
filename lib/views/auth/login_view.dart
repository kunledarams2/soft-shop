import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/auth/auth_viewmodel.dart';

class LoginView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BasePartialBuild<AuthViewModel>(
      builder: (context, model) => SingleChildScrollView(
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
                  'Login',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 40.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              SizedBox(height: 10.h),
              AnimatedCrossFade(
                firstChild: Column(
                  children: [
                    Text(
                      'Please enter your email or phone number used to create your account',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: BrandColors.grey8B),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      labelText: 'Phone or Email Address',
                      suffixIcon: 'phone'.svg,
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please enter your Password',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: BrandColors.grey8B),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      labelText: 'Password',
                      type: TextFieldType.password,
                      suffixIcon: 'phone'.svg,
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgotPass');
                      },
                      child: Center(
                        child: Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: BrandColors.grey8B),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
                crossFadeState: model.showLoginPassword
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 250),
              ),
              CustomButton(
                  title: model.showLoginPassword ? 'Login' : 'Continue',
                  func: () {
                    if(model.showLoginPassword) {
                      model.navigateToMain();
                    } else {
                      model.setShowLoginPassword();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
