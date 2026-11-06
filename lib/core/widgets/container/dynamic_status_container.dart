import 'package:flutter/material.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/core/widgets/container/custom_rounder_container.dart';

import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/text_style.dart';

class DynamicStatusContainer extends StatelessWidget {
  const DynamicStatusContainer({
    super.key,
    required this.status,
    this.fontColor,
    this.color,
  });
  final String status;
  final Color? fontColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomRounderContainer(
      showShadow: false,
      padding: EdgeInsets.symmetric(
        vertical: SizesConfig.xs,
        horizontal: SizesConfig.md,
      ),
      backgroundColor: color ?? AppColors.green4.withOpacity(0.3),
      child: Text(
        "● ${status.toLowerCase()}",
        style: AppTextStyle.bodyXs(color: fontColor ?? AppColors.green4),
      ),
    );
  }
}
