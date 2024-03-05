import 'package:flutter_agribisnisku/data/models/responses/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  //save auth data
  Future<void> saveAuthData(LoginResponseModel model) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth', model.toJson());
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth');
  }

  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = LoginResponseModel.fromJson(authJson);
    return authData.jwt ;
  }

  Future<User> getUser() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = LoginResponseModel.fromJson(authJson);
    return authData.user;
  }

  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }
}

