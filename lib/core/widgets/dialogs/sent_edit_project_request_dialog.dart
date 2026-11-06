import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/widgets/buttons/text-button/cancel_text_button.dart';
import 'package:two_client_app/core/widgets/buttons/text-button/save_text_button.dart';
import 'package:two_client_app/core/widgets/main_text_field.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';

Future<dynamic> sentEditProjectRequestDialog(
  BuildContext context,
  int projectId,
) {
  final messageController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) => SizedBox(
      height: 100,
      child: AlertDialog(
        title: Text(TextStrings.sentEditMessage, style: AppTextStyle.bodyLg()),
        content: SizedBox(
          width: SizesConfig.dialogWidthXl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PaddingConfig.h16,
              MainTextField(
                hint: TextStrings.write,
                label: TextStrings.message,
                maxLines: 15,
                controller: messageController,
                validator: (p0) {
                  if (p0 == null) {
                    return "Un Valid Message";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          const CancelTextButton(),
          SaveTextButton(
            onPressed: () {
              context.read<AppBloc>().add(
                SentEditProjectRequestEvent(
                  projectId: projectId,
                  editMessage: messageController.text,
                ),
              );
              context.pop();
            },
          ),
        ],
      ),
    ),
  );
}
