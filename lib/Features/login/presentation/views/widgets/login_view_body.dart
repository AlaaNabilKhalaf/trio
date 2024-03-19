import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trio_dj/Features/home/presentation/views/home_view.dart';
import '../../../../../constance.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/cubit/auth_cubit.dart';
import '../../../data/cubit/auth_states.dart';
import 'login_logo.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {


  goHome(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Home()));

}
    return BlocConsumer<AuthCubit , AuthStates>(
      listener: (context , state ){
        if(state is ApiLoginFailed){

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(
            alignment: Alignment.center,
            height: 40.h,
            child: Text(state.message),
          )));

        }
      },

      builder: (context , state ){
      final cubit = BlocProvider.of<AuthCubit>(context);

      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 80.h , horizontal: 40.w),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const LoginLogoWidget(),
                Padding(
                  padding: EdgeInsets.symmetric( vertical: 120.h),
                  child: GestureDetector(
                    onTap: () async {
                      await cubit.signInWithGoogle();
                      goHome();


                    },
                    child: const CustomButton(
                        horizontalPadding: 20,
                        title: "Login by Google",
                        buttonColor: kPrimaryColor,
                        fontSize: 22,
                        width: 320,
                        height: 70,
                        borderColor: Colors.grey,
                        sideWidget: GoogleIcon()),
                  ),
                )

              ],
            ),
          ),
        ),
      );
    },

    );
  }
}
