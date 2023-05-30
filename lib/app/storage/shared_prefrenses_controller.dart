import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  // private named Controller
  SharedPrefController._();

  static SharedPrefController? _instance;

  late SharedPreferences _preferences;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPrefrenses () async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setEmail (String email) async {
    await _preferences.setString("email", email);
  }

  Future<void> setLogin (bool login) async {
    await _preferences.setBool("login", login);
  }

  Future<bool> clear() async{
    return _preferences.clear();
  }

  String getEmail ()  {
    return _preferences.getString("email") ?? "";
  }

  bool getLogin () {
    return _preferences.getBool("login") ?? false ;
  }

  Future<void> setShowOutBourdingScreen (bool show) async {
    await _preferences.setBool("show", show);
  }

  bool getShowOutBourdingScreen () {
    return _preferences.getBool("show") ?? false;
  }

  Future<void> setThemeData (String theme) async{
    await _preferences.setString("theme", theme);
  }

  String getThemeData () {
    return _preferences.getString("theme") ?? "light";
  }

}