import 'package:flutter/material.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class YesTextBotton extends StatelessWidget {
  const YesTextBotton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        TextStrings.yes,
        style: AppTextStyle.buttonStyle(color: AppColors.red2),
      ),
    );
  }
}
