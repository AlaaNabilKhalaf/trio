import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.buttonColor,
    required this.borderColor,
    required this.fontSize,
    required this.width,
    required this.height,
    required this.sideWidget,
    required this.horizontalPadding,
  });
  final String title ;
  final double height ;
  final double width ;
  final double fontSize ;
  final Color buttonColor ;
  final Color borderColor ;
  final Widget sideWidget ;
  final double horizontalPadding;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: borderColor
        ),
        color: buttonColor
      ),
      height: height.h,
      width: width.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sideWidget,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
            child: Text(title,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white
            ),),
          ),
        ],
      )
    );
  }
}
