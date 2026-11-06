import 'package:flutter/material.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class SeeAllTextButton extends StatelessWidget {
  final VoidCallback onpressed;
  const SeeAllTextButton({required this.onpressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Text(
        TextStrings.seeAll,
        style: AppTextStyle.bodyMd(color: AppColors.mainColor),
      ),
    );
  }
}
