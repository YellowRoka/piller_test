import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/feature/login_page/cubit/login_page_cubit.dart';
import 'package:piller_test/feature/login_page/ui_parts/input_data_field.dart';
import 'package:piller_test/feature/login_page/ui_parts/login_button.dart';
import 'package:piller_test/generated/locale_keys.g.dart';

class LoginCard extends StatelessWidget {
  final String? userName;
  final String? password;
  final String? errorOnUserInput;
  final String? errorOnPasswordInput;

  const LoginCard({
    super.key, 
    required this.userName, 
    required this.password, 
    required this.errorOnUserInput, 
    required this.errorOnPasswordInput, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:    400,
      padding:   const EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child:     Card(
        elevation: 10,
        child:     Padding(
          padding: const EdgeInsets.all(20.0),
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              InputDataField(
                initData:  userName,
                label:     LocaleKeys.userName.tr(context: context),
                leadIcon:  const Icon(Icons.person),
                onChange:  (value) => context.read<LoginPageCubit>().userNameChanged(value),
                errorText: errorOnUserInput,
              ),
          
              InputDataField(
                initData:          password,
                label:             LocaleKeys.password.tr(context: context),
                leadIcon:          const Icon(Icons.lock),
                onChange:          (value) => context.read<LoginPageCubit>().passwordChanged(value),
                errorText:         errorOnPasswordInput,
                obscureTextNeeded: true,
              ),
          
              LoginButton(
                onTap: () => context.read<LoginPageCubit>().login(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
