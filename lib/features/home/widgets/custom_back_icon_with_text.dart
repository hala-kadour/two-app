import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class CustomBackIconWithText extends StatelessWidget {
  final String text;
  const CustomBackIconWithText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Iconsax.arrow_left, size: 36, color: AppColors.black),
        ),
        Text(text, style: AppTextStyle.headerSm()),
      ],
    );
  }
}
