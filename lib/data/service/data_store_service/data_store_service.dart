import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:piller_test/data/service/auth_service/model/auth_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class DataStoreService {
  static const String _userAuthKeyName = 'userAuth';
  static const String _passwordKeyName = 'password';

  final SharedPreferences sharedPreferences;

  AuthDataModel? _tempCollectedUserData;
  AuthDataModel get getTempCollectedUserData => _tempCollectedUserData!;

  DataStoreService(this.sharedPreferences){
    String  tempUserName = sharedPreferences.getString(_userAuthKeyName) ?? '';
    String tempPassword = sharedPreferences.getString(_passwordKeyName) ?? '';
    
    _tempCollectedUserData = AuthDataModel(
      userName: tempUserName, 
      password: tempPassword,
    );
  }

  Future<void> setTempUserData(AuthDataModel? authDataModel) async => _tempCollectedUserData = authDataModel;

  Future<void> saveActiveUserDetails() async {
    //INFO: try to save values parallel 
    sharedPreferences.setString(_userAuthKeyName, _tempCollectedUserData!.userName!).then( (result) => log('user updated: $result')     );
    sharedPreferences.setString(_passwordKeyName, _tempCollectedUserData!.password!).then( (result) => log('password updated: $result') );
  }

  Future<void> removeActiveUserDetails() async {
    //INFO: try to delete values parallel
    sharedPreferences.remove(_userAuthKeyName).then( (result) => log('user removed: $result'     ) );
    sharedPreferences.remove(_passwordKeyName).then( (result) => log('password removed: $result' ) );
  }
}
