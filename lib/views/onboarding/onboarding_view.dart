import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/onboarding/onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  Widget indicator(int currentp, int index) {
    bool isActive = currentp == index;
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      // margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 4.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        // shape: BoxShape.circle,
        color: isActive ? BrandColors.primary : BrandColors.greyD9
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: Utils.statusBarPadding),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    indicator(model.page, 0),
                    SizedBox(width: 10.w,),
                    indicator(model.page, 1),
                    SizedBox(width: 10.w,),
                    indicator(model.page, 2),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: model.pageController,
                  onPageChanged: model.setPage,
                  children: [
                    onboardingItem(
                      context: context,
                      image: 'onboarding1'.png,
                      text1: 'Relax, ordering just got easier',
                      text2: 'Shop online and get your groceries delivered from stores to your home in as fast as 1hour'
                    ),
                    onboardingItem(
                      context: context,
                      image: 'onboarding2'.png,
                      text1: 'Your “customer” is a click away',
                      text2: 'Shop online and get your groceries delivered from stores to your home in as fast as 1hour'
                    ),
                    onboardingItem(
                      context: context,
                      image: 'onboarding3'.png,
                      text1: 'Order away!',
                      text2: 'Shop online and get your groceries delivered from stores to your home in as fast as 1hour'
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Column(
                  children: [
                    CustomButton(
                      title: model.page == 2 ? 'Continue' : 'Next',
                      func: () {
                        if(model.page == 2) {
                          model.navigateToLogin();
                        } else {
                          model.next();
                        }
                      }
                    ),
                    SizedBox(height: 10.h,),
                    CustomButton(
                      title: model.page == 2 ? '' : 'Skip',
                      color: Colors.transparent,
                      filled: false,
                      func: (){
                        if(model.page != 2) {
                          model.navigateToLogin();
                        }
                      }
                    ),
                    SizedBox(height: 50.h,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget onboardingItem({BuildContext context, String image, text1, text2, int index}) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20.h,),
          Image.asset(
            image,
            height: 340.h,
          ),
          SizedBox(height: 10.h,),
          Container(
            width: 240.w,
            child: Text(
              text1,
              style: Theme.of(context).textTheme.headline6.copyWith(
                fontSize: 24.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
            width: 240.w,
            child: Text(
              text2,
              style: Theme.of(context).textTheme.headline5.copyWith(
                fontSize: 14.sp,
                color: BrandColors.textLight8B,
                fontWeight: FontWeight.w500,
                height: 1.8.h
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}