import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork{
  static late SharedPreferences sharedPref;
  static Future cacheInitialization() async {
    sharedPref  = await SharedPreferences.getInstance();
  }

//set , get , delete , clear ( key , value )

  static Future<bool> insertStrings({required String key,
    required String value , }) async {
    return await sharedPref.setString(key , value );
  }

  static String getCacheData ({required String key}){
    return sharedPref.getString(key) ?? "";
  }


  // static int getCacheId ({required String key}){
  //   return sharedPref.getInt(key) ?? 0 ;
  // }

  static Future<bool> deleteCacheItem ({required String key}) async {
    return await sharedPref.remove(key);
  }


}