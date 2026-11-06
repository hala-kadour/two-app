import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/functions/bloc_state_handling/app_bloc_state_handling.dart';
import 'package:two_client_app/core/widgets/buttons/icon-button/custom_back_button.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';
import 'package:two_client_app/features/auth/widgets/forms/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) async {
          await AppBlocStateHandling().login(state, context);
        },
        listenWhen: (previous, current) =>
            previous.userModelStatus != current.userModelStatus,
        child: Padding(
          padding: PaddingConfig.pagePadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomBackButton(),
                PaddingConfig.h8,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        TextStrings.loginYourAccount,
                        style: AppTextStyle.headerMd(color: AppColors.black),
                      ),
                    ),
                  ],
                ),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
