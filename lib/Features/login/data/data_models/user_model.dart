class UserModel {
  String? name;
  String? userName;
  int? id;
  bool? isDj;
  String? avatarPath;
  String? email;
  bool? emailVerified;
  bool? isTop;
  String? phoneNumber;
  String? deviceToken;
  String? locale;
  String? message;
  String? token;
  bool? signedIn;

  UserModel(this.name,
      this.email,
      this.deviceToken,
      this.emailVerified,
      this.id,
      this.isDj,
      this.isTop,
      this.locale,
      this.phoneNumber,
      this.signedIn,
      this.message,
      this.avatarPath,
      this.token,
      this.userName,);


  UserModel.jsonDate({required Map<dynamic, dynamic> userData}){
    name = userData["name"] ;
    email = userData["email"] ;
    userName = userData["username"] ;

    isDj = userData["is_dj"] ;
    id = userData["id"] ;
    avatarPath = userData["avatar_path"] ;

    emailVerified = userData["email_verified"] ;
    isTop = userData["is_top"] ;
    phoneNumber = userData["phone_number"] ;

    deviceToken = userData["device_token"] ;
    locale = userData["locate"] ;
    message = userData["message"] ;
    token = userData["token"] ;
    signedIn = userData["signed_in"] ;
  }

  Map<dynamic , dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "username": userName,

      "is_dj": isDj,
      "avatar_path": avatarPath,
      "email": email,

      "email_verified": emailVerified,
      "is_top": isTop,
      "phone_number": phoneNumber,

      "device_token": deviceToken,
      "locale": locale,
      "message": message,
      "token" : token ,
      "signed_in": signedIn

    };



  }







//   {
//   "data": {
//   "id": 3,
//   "name": "Samy",
//   "username": "samy",
//   "is_dj": false,
//   "avatar_path": "https://userpic.icon/avatar",
//   "email": null,
//   "email_verified": false,
//   "is_top": false,
//   "phone_number": null,
//   "device_token": null,
//   "locale": "en"
//   },
//   "success": true,
//   "meta": {
//   "message": "Login Success!",
//   "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3RyaW9kai5jb20vYXBpL2F1dGgiLCJpYXQiOjE3MTA3NTg4ODIsImV4cCI6MjMxMDc1ODgyMiwibmJmIjoxNzEwNzU4ODgyLCJqdGkiOiJRdkJYMzJucjRpc0tSU2VUIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.KBPM6vrwKrGjkN3NpY5i_1Eux4kN72ntflEd9SZC16M",
//   "signed_in": true
//   }
}
































