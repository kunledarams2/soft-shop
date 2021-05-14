import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/auth/auth_viewmodel.dart';

class AccountDetails extends StatelessWidget {
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
                  top: 10.h,
                ),
                child: Text(
                  'Set up account',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: 28.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Finish setting up your account',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: BrandColors.grey8B
                ),
              ),
              SizedBox(height: 30.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    labelText: 'Full name',
                    suffixIcon: 'phone'.svg,
                  ),
                  SizedBox(height: 25.h),
                  CustomTextField(
                    labelText: 'Phone number',
                    suffixIcon: 'phone'.svg,
                  ),
                  SizedBox(height: 25.h),
                  CustomTextField(
                    labelText: 'Date of Birth',
                    suffixIcon: 'phone'.svg,
                  ),
                  SizedBox(height: 25.h),
                  CustomTextField(
                    labelText: 'Password',
                    suffixIcon: 'phone'.svg,
                  ),
                  SizedBox(height: 25.h),
                ],
              ),
              SizedBox(height: 40.h),
              CustomButton(
                title: 'Create account',
                func: () => model.navigateToAccountReady()
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}