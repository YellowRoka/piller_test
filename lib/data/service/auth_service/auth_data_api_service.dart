import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:piller_test/data/service/auth_service/model/auth_data_model.dart';
import 'package:piller_test/generated/locale_keys.g.dart';


@singleton
class AuthDataApiService {
  final String? _activeUser         = dotenv.env['activeUser'];
  final String? _activeUserPassword = dotenv.env['activeUserPassword'];

  Future<String?> login(AuthDataModel user) async {
    
    await Future.delayed(const Duration(milliseconds: 500)); /* Simulation for server delay */

    if( 
      _activeUser         == null || 
      _activeUserPassword == null ||
      _activeUser         == ''   || 
      _activeUserPassword == ''  
    ) {
      log('There is no active user setup in .env!');
      return LocaleKeys.missingActiveUser.tr();
    }

    if( user.userName != _activeUser         ){ return LocaleKeys.userNotFound.tr();  }
    if( user.password != _activeUserPassword ){ return LocaleKeys.wrongPassword.tr(); }

    return null;
  }
}
