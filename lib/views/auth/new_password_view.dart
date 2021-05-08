import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/auth/auth_viewmodel.dart';

class NewPasswordView extends StatelessWidget {
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
                          'Enter new password',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 28.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Enter new password, you can’t use your old password',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: BrandColors.grey8B
                        ),
                      ),
                      SizedBox(height: 30.h),
                      CustomTextField(
                        labelText: 'Password',
                        suffixIcon: 'phone'.svg,
                      ),
                      SizedBox(height: 40.h),
                      CustomButton(title: 'Reset', func: () {}),
                      SizedBox(height: 30.h),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: 'Remember password? ',
                            style: Theme.of(context).textTheme.headline5.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(.5)
                            ),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = () => model.navigateToLogin(),
                                text: 'Login',
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
