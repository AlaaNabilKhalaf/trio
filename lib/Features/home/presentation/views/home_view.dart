import 'package:flutter/material.dart';
import 'package:trio_dj/Features/home/presentation/views/widgets/home_view_body.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: GestureDetector(
      //   onTap: (){
      //     GoogleSignIn google = GoogleSignIn();
      //     google.disconnect();
      //     Navigator.push(context, MaterialPageRoute(builder: (context){
      //       return const LoginView();
      //     }));
      //   },
      //   child: const Center(
      //     child: CustomButton(
      //         horizontalPadding: 8,
      //         title: "Log Out",
      //         buttonColor: kPrimaryColor,
      //         fontSize: 22,
      //         width: 320,
      //         height: 70,
      //         borderColor: Colors.grey,
      //         sideWidget: Center(child: SizedBox())),
      //   ),
      // ),


      body: HomeViewBody(),
    );
  }
}
