import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/feature/home_page/cubit/home_page_cubit.dart';
import 'package:piller_test/generated/locale_keys.g.dart';
import 'package:piller_test/system/themes/app_colors.dart';
import 'package:piller_test/system/themes/app_themes.dart';

class MessageCard extends StatelessWidget {
  final String? message;
  final bool    isRefreshEnabled;
  
  const MessageCard({
    super.key, 
    required this.message, 
    required this.isRefreshEnabled
 });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 90,
        width:  320,
        child: ElevatedButton(
          style:     messageCardStyle,
          onPressed: 
            ( isRefreshEnabled                                 )?
            ( () => context.read<HomePageCubit>().getAllData() ):
            ( (){}                                             ), 
          child:     Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text( 
                message ?? LocaleKeys.emptyMessage.tr(context: context),
                style: messageCardTextStyle,
              ),
              
              if(isRefreshEnabled)...[
                Icon(
                  Icons.refresh_sharp,
                  color: messageRefreshIconColor,
                  size:  35,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
