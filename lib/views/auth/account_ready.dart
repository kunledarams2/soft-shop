import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/auth/auth_viewmodel.dart';

class AccountReady extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) => Material(
        child: Container(
          padding: Utils.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundColor: Color(0xFFF1F1F1),
              ),
              SizedBox(height: 20.h,),
              Text(
                'Your account is ready',
                style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.h,),
              Center(
                child: Container(
                  width: 380.w,
                  child: Text(
                    'By Signing up you agree to our Terms Conditions & Privacy Policy.',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      color: BrandColors.grey86
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              CustomButton(
                title: 'Continue',
                func: () => model.navigateToMain()
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}