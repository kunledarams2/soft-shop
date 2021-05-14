import 'package:softshop_mobile/core/utils/exports.dart';
import 'package:softshop_mobile/views/auth/account_details.dart';
import 'package:softshop_mobile/views/auth/auth_viewmodel.dart';
import 'package:softshop_mobile/views/auth/verify_email.dart';

class SetupAccountHolder extends StatelessWidget {
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
          child: PageView(
            controller: model.setupAccountController,
            children: [
              VerifyEmail(),
              AccountDetails()
            ],
          )
        ),
      ),
    );
  }
}
