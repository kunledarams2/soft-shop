import 'package:softshop_mobile/core/utils/exports.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function func;
  final bool filled;
  final Color color;

  const CustomButton({Key key, @required this.title, @required this.func,this.filled = true, this.color}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => func(),
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color == null ? filled ? BrandColors.primary : Colors.transparent : color,
          border: Border.all(
            color: color  == null ? filled ? Colors.transparent: BrandColors.primary : color,
          ),
          borderRadius: BorderRadius.circular(10.r)
        ),
        child: Center(
          child: Text(
            '$title',
            style: Theme.of(context).textTheme.headline4.copyWith(
              color: filled ? Colors.white : BrandColors.grey50,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}