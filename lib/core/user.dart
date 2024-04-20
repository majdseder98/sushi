import 'package:sushi/core/cashe_helper.dart';

class UserData {
  static String? uid = '';

  static Future<bool> clearUserData() async {
    uid = null;
    return CacheHelper.clear;
  }
  
}
