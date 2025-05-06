import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:piller_test/data/service/auth_service/model/auth_data_model.dart';
import 'package:piller_test/generated/locale_keys.g.dart';
import 'package:piller_test/miscs/extensions/encrytion_extension.dart';

@singleton
class AuthDataApiService {

  static const String activeUserNameKey         = 'activeUser';
  static const String activeUserPasswordKeyName = 'activeUserPassword';

  final Map<String, String> _users = {};

  AuthDataApiService(){
    setupActiveUsers();
  }

  void setupActiveUsers(){
    final String? activeUser         = dotenv.env[activeUserNameKey];
    final String? activeUserPassword = dotenv.env[activeUserPasswordKeyName];

    if( 
      activeUser         == null || 
      activeUserPassword == null ||
      activeUser         == ''   || 
      activeUserPassword == ''  
    ) {
      log('There is no active user setup in .env!');
    }
    else{
      final ecrypted = activeUserPassword.encryptPassword();
      _users[activeUser] = ecrypted;
    }
  }

  Future<String?> login(AuthDataModel user) async {
    if( _users.isEmpty ){
      return LocaleKeys.missingActiveUser.tr();
    }
    
    await Future.delayed( const Duration(milliseconds: 500) ); /* Simulation for server delay */

    if( !_users.containsKey(user.userName) ){
      return LocaleKeys.userNotFound.tr();
    }

    if( _users[user.userName] != user.password!.encryptPassword() ){
      return LocaleKeys.wrongPassword.tr();
    }

    return null;
  }
}
