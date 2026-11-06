import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/widgets/buttons/text-button/cancel_text_button.dart';
import 'package:two_client_app/core/widgets/buttons/text-button/yes_text_botton.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';

Future<dynamic> showLogoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        TextStrings.wannaLogout,
        style: AppTextStyle.bodyLg(color: AppColors.red2),
      ),
      actions: [
        const CancelTextButton(),
        YesTextBotton(
          onPressed: () {
            context.read<AppBloc>().add(LogoutEvent());
          },
        ),
      ],
    ),
  );
}
