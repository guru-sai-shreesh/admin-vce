import 'dart:convert';
import 'package:admin_vce/model/login_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    await _preferences.setString("User", json);
  }

  static User getUser() {
    final json = _preferences.getString("user");
    return User.fromJson(jsonDecode(json!));
  }
}
