import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/auth/auth_viewmodel.dart';

class VerifyEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePartialBuild<AuthViewModel>(
      builder: (context, model) => Column(
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
                      top: 10.h,
                    ),
                    child: Text(
                      'Verify email address',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 28.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Enter the 4-Digit code sent to you at walika2019@gmail.com',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: BrandColors.grey8B
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Container(
                      width: 300.w,
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        enablePinAutofill: true,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          fieldHeight: 50.h,
                          fieldWidth: 50.w,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          disabledColor: Colors.white,
                          activeColor: BrandColors.primary,
                          inactiveColor: Color(0xFF010F07).withOpacity(.5),
                          selectedColor: BrandColors.primary,
                          selectedFillColor: Colors.white,
                        ),
                        cursorColor: Color(0xFF22A45D),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        controller: model.pinController,
                        onCompleted: (v) {},
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  CustomButton(
                    title: 'Create account',
                    func: () => model.next(model.setupAccountController)
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Didn’t receive code? ',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(.5)
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = (){},
                            text: 'Resend Again.',
                            style: Theme.of(context).textTheme.headline5.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: BrandColors.primary
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}