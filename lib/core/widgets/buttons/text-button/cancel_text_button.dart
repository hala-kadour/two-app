import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class CancelTextButton extends StatelessWidget {
  const CancelTextButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          onPressed ??
          () {
            context.pop();
          },
      child: Text(
        TextStrings.cancel,
        style: AppTextStyle.buttonStyle(color: AppColors.fontLightColor),
      ),
    );
  }
}
