import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets.dart';

class LoginLogoWidget extends StatelessWidget {
  const LoginLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Positioned(
            child: Image.asset(AssetsData.bubbles)
        ),
        Positioned(
          top: 125.h,
          left: 33.w,
          child: Image.asset(AssetsData.radio,
            height: 250,),
        ),
        Positioned(
            top: 92.h,
            left: 90.w,
            child: Image.asset(AssetsData.logo,
              width: 190,)
        ),
      ],
    );

  }
}


class GoogleIcon extends StatelessWidget {
  const GoogleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Image.asset(AssetsData.google,
      height: 50,
      ),
    );
  }
}
