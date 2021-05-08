import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/auth/auth_viewmodel.dart';

class OtpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              PlatformIcons(context).back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
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
                          top: 10.h,
                        ),
                        child: Text(
                          'Enter OTP',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 28.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Enter the 4-Digit code sent to you at walika2019@gmail.com.',
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
                      CustomButton(title: 'Continue reset', func: () => model.navigateToNewPassword()),
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
                    ],
                  ),
                ),
              ),
            ],
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
