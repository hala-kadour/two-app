import 'package:flutter/material.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class CustomAddNavyButton extends StatelessWidget {
  const CustomAddNavyButton({
    required this.text,
    required this.onTap,
    super.key,
  });
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.navy1,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.add, color: AppColors.cardColor, size: 20),
            const SizedBox(width: 3),
            Text(
              text,
              style: AppTextStyle.buttonStyle(color: AppColors.cardColor),
            ),
          ],
        ),
      ),
    );
  }
}
