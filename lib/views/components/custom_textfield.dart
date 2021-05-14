import 'package:softshop_mobile/core/utils/exports.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextStyle style;
  final String hintText;
  final String prefixImage;
  final String suffixIcon;
  final String labelText;
  final Function suffixIconFunc;
  final int minLines;
  final int maxLines;
  final TextEditingController controller;
  final bool obscure;
  final TextInputAction action;
  final TextInputType inputType;
  final Function onChanged;
  final Function suffixFunc;
  final String errorText;
  final bool enabled;
  final String helperText;
  final TextStyle helperStyle;
  final int maxLength;
  final bool center;
  final bool showCusor;
  final bool readOnly;
  final bool autofocus;
  final Function onSubmit;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final TextFieldType type;
  final bool validate;
  final bool symbol;
  final bool rounded;
  // final UserBloc _userBloc = locator<UserBloc>();

  CustomTextField({Key key, this.label, this.style, this.hintText, this.prefixImage, this.suffixIcon, this.suffixIconFunc, this.minLines, this.maxLines, this.controller, this.obscure, this.action, this.inputType, this.onChanged, this.suffixFunc, this.errorText, this.enabled, this.helperText, this.helperStyle, this.maxLength, this.onSubmit, this.focusNode, this.center = false, this.showCusor = true, this.readOnly = false, this.autofocus = false, this.textInputAction, this.inputFormatters, this.type = TextFieldType.others, this.symbol = false, this.validate = true, this.rounded = false, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        label ==null ? SizedBox() : Container(
          // margin: EdgeInsets.only(bottom: 5.h),
          child: Text(
            label,
            style: Theme.of(context).textTheme.headline5.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: BrandColors.primary
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if(validate) {
                      if (value.isEmpty) {
                        return "Field cannot be empty";
                      } else if(type == TextFieldType.amount) {
                        if(double.tryParse(value.replaceAll(',', '')) == null) {
                          return 'Enter a valid amount';
                        } else if(double.tryParse(value.replaceAll(',', '')) <= 0) {
                          return 'Enter a valid amount';
                        }
                      } else if(type == TextFieldType.email) {
                        bool isValidEmail = RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value);
                        return isValidEmail ? null : "Please provide a valid email address";
                      }
                    }

                    return null;
                  },
                  inputFormatters: type == TextFieldType.amount ? [
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsFormatter(),
                    LengthLimitingTextInputFormatter(7),
                  ] : inputFormatters,
                  focusNode: focusNode,
                  autofocus: autofocus,
                  showCursor: showCusor,
                  readOnly: readOnly,
                  enableInteractiveSelection: true,
                  enabled: enabled == null ? true : enabled,
                  controller: controller,
                  maxLines: maxLines == null ? 1 : maxLines,
                  minLines: minLines,
                  obscureText: obscure == null ? false : obscure,
                  style: style ?? TextStyle(
                    fontSize: 16.sp,
                    fontFamily: symbol ? 'Roboto' : 'GTWalsheimPro'
                  ),
                  textAlign: center ? TextAlign.center : TextAlign.start,
                  textInputAction: textInputAction == null ? TextInputAction.done : textInputAction,
                  onEditingComplete: onSubmit,
                  keyboardType: inputType == null ? TextInputType.text : inputType,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: onChanged,
                  maxLength: maxLength,
                  decoration: new InputDecoration(
                    fillColor: Color(0xFFF1F2F6),
                    filled: rounded,
                    labelText: labelText,
                    labelStyle: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(
                          fontSize: 16.sp, color: BrandColors.grey86),
                    hintText: hintText ?? '',
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300
                    ),
                    helperText: helperText,
                    helperStyle: Theme.of(context).textTheme.headline3.copyWith(
                      fontSize: 12.sp,
                      color: BrandColors.grey86,
                    ),
                    border: rounded ? OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.r)
                    ) : UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: BrandColors.grey86.withOpacity(.5),
                        width: 1.3
                      ),
                      // borderRadius: BorderRadius.circular(5.r)
                    ),
                    focusedBorder: rounded ? OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.r)
                    ) : UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: BrandColors.green00,
                        width: 1.3
                      ),
                    ),
                    enabledBorder: rounded ? OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.r)
                    ) : UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: BrandColors.grey86.withOpacity(.5),
                        width: 1.3
                      ),
                    ),
                    errorBorder: rounded ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red
                      ),
                      borderRadius: BorderRadius.circular(10.r)
                    ) : UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red
                      ),
                    ),
                    errorText: errorText,
                    contentPadding: rounded ? EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 15.w
                    ) : EdgeInsets.zero,
                    prefixIconConstraints: BoxConstraints(
                      minHeight: 40.h,
                      minWidth: 60.w
                    ),
                    prefixIcon: prefixImage == null ? null :Container(
                      child: SvgPicture.asset(
                        prefixImage,
                        fit: BoxFit.none,
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: 40.h,
                      minWidth: 60.w
                    ),
                    suffixIcon: suffixIcon == null ?
                    setPasswordIcon(obscuredText: this.obscure, obscurePassword: this.suffixFunc) : 
                    Container(
                      child: SvgPicture.asset(
                        suffixIcon,
                        fit: BoxFit.none,
                      ),
                    ),
                    
                  ),
                ),
              ),
              // suffixImage == null ? SizedBox() : Container(
              //   margin: EdgeInsets.symmetric(horizontal: 5.w),
              //   child: InkWell(
              //       borderRadius: BorderRadius.circular(5.r),
              //       onTap: suffixFunc,
              //       child: Container(
              //         padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
              //         decoration: BoxDecoration(
              //           color: Color(0xFFB9B9B9).withOpacity(0.12),
              //           borderRadius: BorderRadius.circular(5.r)
              //         ),
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             SvgPicture.asset(
              //               suffixImage,
              //               // color: BrandColors.primary,
              //               width: 6.w,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              // )
            ],
          ),
        ),
      ],
    );
  }

  Widget setPasswordIcon({bool obscuredText, Function obscurePassword}) {
    if (this.type == TextFieldType.password) {
      return IconButton(
        padding: EdgeInsets.all(0.0),
        icon: obscuredText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        onPressed: obscurePassword,
        iconSize: 20.0,
      );
    } else {
      return null;
    }
  }
}