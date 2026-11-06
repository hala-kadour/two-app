import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class CustomFilterButton extends StatelessWidget {
  const CustomFilterButton({required this.onTap, super.key});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.gray2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Iconsax.filter_edit,
              color: AppColors.iconColor,
              size: 20,
            ),
            const SizedBox(width: 3),
            Text(
              "Filter",
              style: AppTextStyle.buttonStyle(color: AppColors.iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
