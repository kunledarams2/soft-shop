import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/splash/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashviewModel>.reactive(
      onModelReady: (model) => model.setup(),
      viewModelBuilder: () => SplashviewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                child: Center(
                  child: Image.asset(
                    'logo'.png,
                    width: 100.w,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 100.h),
                  child: CircularProgressIndicator(
                    backgroundColor: BrandColors.greyA9.withOpacity(.4),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}