import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashService {

  String get getSplashVideoLink {
    String? videoLink = dotenv.env['splashVideoLink'];
    if( videoLink == null ) throw Exception('videoLink not found in .env!');
    return videoLink;
  }

}
