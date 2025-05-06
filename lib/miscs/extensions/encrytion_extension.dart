import 'dart:convert';

import 'package:crypto/crypto.dart';
extension EncryptionExtension on String{

  String encryptPassword(){
    var bytes  = utf8.encode(this);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}
