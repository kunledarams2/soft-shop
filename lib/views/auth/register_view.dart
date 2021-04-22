import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/auth/auth_viewmodel.dart';

class RegisterView extends StatelessWidget {
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
                  'Sign up',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(
                          fontSize: 40.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Please enter your email or phone to create an account',
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
              CustomButton(
                title: 'Create account',
                func: () {
                  model.setShowLoginPassword();
                }
              ),
              SizedBox(height: 20.h),
              Center(
                child: Container(
                  width: 300.w,
                  child: Text(
                    'By Signing up you agree to our Terms Conditions & Privacy Policy.',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: BrandColors.grey86
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
