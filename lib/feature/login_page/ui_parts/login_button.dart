import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/feature/common_widgets/circular_progresser.dart';
import 'package:piller_test/feature/login_page/cubit/login_page_cubit.dart';
import 'package:piller_test/feature/login_page/ui_parts/login_succes_container.dart';
import 'package:piller_test/generated/locale_keys.g.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const LoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width:  200,
        height: 90,
        child:  BlocBuilder<LoginPageCubit, LoginPageState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading:     () => CircularProgresser(),
              loginSucces: () => LoginSuccesContainer(),
              orElse:      () => Padding(
                padding: const EdgeInsets.all(10.0),
                child:   ElevatedButton(
                  onPressed: () => onTap(), 
                  child:     Text( LocaleKeys.login.tr(context: context) ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
