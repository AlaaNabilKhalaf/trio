import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trio_dj/Features/login/presentation/views/login_view.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/data_constance.dart';
import '../../../../home/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController ;
  late Animation<Offset> slidingAnimation ;
goHome(){
  Future.delayed(const Duration(seconds: 2),(){

    Navigator.push(context, MaterialPageRoute(builder: (context ){
      return token != null && token != "" ? const Home() : const LoginView();
    }));

  });
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intiSlidingAnimation();
    goHome();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  void intiSlidingAnimation(){
    animationController = AnimationController(vsync: this , duration: const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(begin: const Offset(0 , 1) , end: Offset.zero ).animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsData.background),
              fit: BoxFit.fill)
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                //height: double.infinity,
                decoration:const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetsData.bubbles),
                        fit: BoxFit.fitWidth)
                ),
                child: Image.asset(AssetsData.radio),
              ),
            ),

           Expanded(
              flex: 1,
              child:  Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.h,),
                child: AnimatedBuilder(
                  animation: slidingAnimation,
                  builder: (context , _ ) {
                    return SlideTransition(
                      position: slidingAnimation,
                      child: Text("Light Up your World with songs, albums and artists that reflect who you are.",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,

                        ),),
                    );
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
