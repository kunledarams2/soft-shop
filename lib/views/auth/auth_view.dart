import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/auth/auth_viewmodel.dart';
import 'package:softshop_mobile/views/auth/login_view.dart';
import 'package:softshop_mobile/views/auth/register_view.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent
        ),
        child: WillPopScope(
          onWillPop: () async {
            if (model.showLoginPassword) {
              model.setShowLoginPassword();
              return false;
            }
            return true;
          },
          child: Scaffold(
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
                        child: PageView(
                          controller: model.pageController,
                          onPageChanged: model.setPage,
                          children: [
                            LoginView(),
                            RegisterView(),
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: BrandColors.greyE6,
                                  thickness: 1.h,
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                'Or continue using',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: BrandColors.black33),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Expanded(
                                child: Divider(
                                  color: BrandColors.greyE6,
                                  thickness: 1.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              otherLoginItem(image: 'google'.svg),
                              SizedBox(
                                width: 60.w,
                              ),
                              otherLoginItem(image: 'facebook'.svg),
                              SizedBox(
                                width: 60.w,
                              ),
                              otherLoginItem(image: 'apple'.svg)
                            ],
                          ),
                          SizedBox(height: 50.h),
                          Center(
                              child: GestureDetector(
                            onTap: () {
                              if (model.showLoginPassword) {
                                model.setShowLoginPassword();
                              }
                              model.page == 0 ? model.next() : model.prev();
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: 'Dont have an account? ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                  children: [
                                    TextSpan(
                                      text: model.page == 0 ? 'Sign Up' : 'Login',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                    )
                                  ]),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
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
