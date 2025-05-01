import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:piller_test/generated/locale_keys.g.dart';
import 'package:piller_test/system/themes/app_themes.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 20,
        child:     Container(
          alignment: Alignment.center,
          padding:   const EdgeInsets.all(10),
          height:    200,
          width:     400,
          child:     Text(
            LocaleKeys.undefinedError.tr(context: context),
            maxLines:  3,
            overflow:  TextOverflow.clip,
            textAlign: TextAlign.center,
            style:     errorTextStyle,
          ),
        ),
      ),
    );
  }
}
