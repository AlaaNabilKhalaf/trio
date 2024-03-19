import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trio_dj/core/Local_network/cache_network.dart';
import 'package:trio_dj/core/bloc_observer/bloc_observer.dart';

import 'Features/login/data/cubit/auth_cubit.dart';
import 'Features/login/data/cubit/auth_states.dart';
import 'Features/splash/presentation/views/splash_view.dart';
import 'constance.dart';
import 'core/utils/data_constance.dart';
import 'firebase_options.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  token = CacheNetwork.getCacheData(key:"token");


  runApp(const TrioApp());
}

class TrioApp extends StatelessWidget {
  const TrioApp({super.key});

// This widget is the root of the application.
  @override
  Widget build(BuildContext context) {


// This Method is controlling the status bar appearance.
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));


// MultiBlocProvider is controlling all app Blocs.
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        ],

        child: BlocConsumer<AuthCubit , AuthStates>(
          builder: (context , state){
            return ScreenUtilInit(
              designSize: const Size(428, 926),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context , child){
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData().copyWith(
                      scaffoldBackgroundColor: kPrimaryColor
                  ),
                  home: const SplashView(),
                );
              },
            ) ;
          },
          listener: (context , state){},
        ));
  }
}

