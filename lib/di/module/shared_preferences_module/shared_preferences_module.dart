import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesModule{
  @singleton
  @preResolve
  Future<SharedPreferences> initSharedPref() => SharedPreferences.getInstance();
}
