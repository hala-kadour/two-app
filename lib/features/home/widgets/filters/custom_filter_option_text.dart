import 'package:flutter/material.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class CustomFilterOptionText extends StatelessWidget {
  final String text;
  const CustomFilterOptionText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.bodySm(color: AppColors.fontLightColor),
    );
  }
}
