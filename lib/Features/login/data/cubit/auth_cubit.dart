import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http ;
import 'package:trio_dj/core/Local_network/cache_network.dart';
import 'package:trio_dj/core/utils/app_logger.dart';

import 'auth_states.dart';
class AuthCubit extends Cubit <AuthStates> {
  AuthCubit() : super(AuthInitialState());


// API Login
  Future<void> login({
    required uid,
    String? name,
    String? avatar,
  }) async {
    emit(ApiLoginLoading());

    try {
      Response response = await http.post(
          Uri.parse(
              "https://triodj.com/api/auth?provider_id=$uid&provider_name=google"),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Client-Type": "web",
            "Client-Version": "1.0.0",
          }
      );

AppLogger.log("status code: ${response.statusCode}");
      if (response.statusCode == 200) {
        Map<String, dynamic> data =  json.decode(response.body);
AppLogger.log("start success ");
          CacheNetwork.insertStrings(
              key: "token", value: data["meta"]["token"]);
          CacheNetwork.insertStrings(key: "name", value: data["data"]["name"]);
          emit(ApiLoginSuccess());

      }
    } catch (e) {
      print("ErOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOr ${e.toString()}");

      emit(ApiLoginFailed(
        message: e.toString()
      ));
    }


// {
//   "data": {
//    "id": 3,
//    "name": "Samy",
//    "username": "samy",
//    "is_dj": false,
//    "avatar_path": "https://userpic.icon/avatar",
//    "email": null,
//    "email_verified": false,
//    "is_top": false,
//    "phone_number": null,
//    "device_token": null,
//    "locale": "en"
//  },
//    "success": true,
//    "meta": {
//    "message": "Login Success!",
//    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RyaW9kai5jb20vYXBpL2F1dGgiLCJpYXQiOjE3MTA3NTIwNjksImV4cCI6MjMxMDc1MjAwOSwibmJmIjoxNzEwNzUyMDY5LCJqdGkiOiJxRVh3ZlBGTTZFQnlrRU0wIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.gAQfoxzV2_t61bhSiydiIWfUPsyOP7yPHNVpfdKRq3M",
//    "signed_in": true
//  }
//  }


  }


// Google Auth
  Future<Object> signInWithGoogle() async {
    emit(GoogleAuthLoading());
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // This Method is For Logging Out.
    if (googleUser == null) {
      emit(GoogleAuthLoggedOUT());
      return "";
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return {
      await FirebaseAuth.instance.signInWithCredential(credential).then((
          value) async {
        emit(GoogleAuthSuccess());

        await login(
          uid: value.user!.uid,
          name: value.user!.displayName ?? "",
          avatar: value.user!.photoURL ?? "",);
        print(value.user);

        emit(GoogleAuthAndLoginSuccess());
      }),

    };
  }


//
// User(displayName: Alaa Khalaf, email: alaakhalaf696@gmail.com, isEmailVerified: true, isAnonymous: false, metadata:
// UserMetadata(creationTime: 2024-03-17 11:00:52.863Z, lastSignInTime: 2024-03-18 09:43:06.077Z),
// phoneNumber: null
// , providerData, [UserInfo(displayName: Alaa Khalaf, email: alaakhalaf696@gmail.com,
// phoneNumber: null,
// providerId: google.com, uid: 100695708394702904861)7046pZWyEgSquSRX1nf00R7aASW2)


//
//
// }],
// refreshToken: null, tenantId: null, uid:


}