import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static void saveUserId(String userId) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('userId', userId);
  }

  static Future<String> getUserId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('userId') ?? '';
  }

  static void logOut() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('userId');
  }
}
