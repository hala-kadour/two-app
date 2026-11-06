import 'package:flutter/material.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class CustomAddGreenButton extends StatelessWidget {
  const CustomAddGreenButton({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 80,
        decoration: BoxDecoration(
          color: AppColors.green4,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.cardColor),
        ),
        child: Center(
          child: Text(
            TextStrings.add,
            style: AppTextStyle.buttonStyle(color: AppColors.cardColor),
          ),
        ),
      ),
    );
  }
}
