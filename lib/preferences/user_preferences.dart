import 'package:project2/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._();
  late SharedPreferences _sharedPreferences;

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._();

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future save(User user) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setInt('id', user.id);
    await _sharedPreferences.setString('mobile', user.mobile);
    await _sharedPreferences.setString('token', user.token);
    await _sharedPreferences.setString('city_name_ar', user.city!.nameAr);
    await _sharedPreferences.setString('city_name_en', user.city!.nameEn);
  }

  Future<bool> setUserName(String name) async{
   return await _sharedPreferences.setString('name', name);
  }
  Future<bool> setGender(String gender) async{
    return await _sharedPreferences.setString('gender', gender);

  }
  Future<bool> setCityId(int cityId) async{
    return  await _sharedPreferences.setInt('city_id', cityId);

  }
  int get id => _sharedPreferences.getInt('id') ?? 0;
  int get city_id => _sharedPreferences.getInt('city_id') ?? 0;
  String get city_en => _sharedPreferences.getString('city_name_en') ?? "";
  String get userName => _sharedPreferences.getString('name') ?? "";
  String get gender => _sharedPreferences.getString('gender') ?? "";

  bool get isLoggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }
  String getToken(){
    String token = _sharedPreferences.getString("token") ?? "";
    return "Bearer $token";
  }
  Future<bool> setLanguage(String codeLang) async{
    return await _sharedPreferences.setString("CodeLang", codeLang);
  }

  String get codeLang => _sharedPreferences.getString("CodeLang") ?? "en";
}
