import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:piller_test/di/di.dart';
import 'package:piller_test/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:piller_test/system/langauges/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await configureDependencies();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: languages,
      path:             'assets/translations', 
      startLocale:      languages[0],
      fallbackLocale:   languages[0],
      useOnlyLangCode:  true,
      saveLocale:       true,
      child:            const MyApp()
    )
  );
}
