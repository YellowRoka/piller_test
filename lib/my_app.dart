import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:piller_test/di/provider/providers.dart';
import 'package:piller_test/generated/locale_keys.g.dart';
import 'package:piller_test/system/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final language  = context.locale;
    final delegates = context.localizationDelegates;

    return MaterialApp.router(
      theme:                  appTheme,
      title:                  LocaleKeys.appTitle.tr(),
      localizationsDelegates: delegates,
      supportedLocales:       context.supportedLocales,
      locale:                 language,
      routerConfig:           appRouterProvider.router,
    );
  }
}
