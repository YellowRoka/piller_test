import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:piller_test/generated/locale_keys.g.dart';
import 'package:piller_test/system/themes/app_colors.dart';
import 'package:piller_test/system/themes/app_themes.dart';

class LoginSuccesContainer extends StatelessWidget {
  const LoginSuccesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:     const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color:       buttonColorSuccess
      ),
      alignment: Alignment.center,
      child:     Text( 
        LocaleKeys.loginSuccess.tr(context: context),
        style: loginSuccesLineStyle
      ),
    );
  }
}
