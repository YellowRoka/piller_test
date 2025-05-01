import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/feature/login_page/cubit/login_page_cubit.dart';
import 'package:piller_test/feature/login_page/ui_parts/login_card.dart';
import 'package:piller_test/system/themes/app_colors.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? errorOnUserInput;
    String? errorOnPasswordInput;
    String? userName;
    String? password;
    
    return BlocConsumer<LoginPageCubit, LoginPageState>(

      listener: (context, state) {
        state.maybeWhen(
          orElse:               (){},
          errorOnUserField:     (message) => errorOnUserInput     = message,
          errorOnPasswordField: (message) => errorOnPasswordInput = message,
          error:                (message) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:         Text(message),
              backgroundColor: errorColor,
            ),
          ),
        );
      },

      builder: (context, state) {
        state.maybeWhen(
          orElse:  (){},
          initial: (user){
            userName = user.userName;
            password = user.password;
          },
        );

        return Center(
          child: LoginCard(
             userName:             userName,
             password:             password,
             errorOnPasswordInput: errorOnPasswordInput,
             errorOnUserInput:     errorOnUserInput,
          ),
        );
      }
    );
  }
}
