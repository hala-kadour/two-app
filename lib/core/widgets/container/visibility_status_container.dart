import 'package:flutter/material.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/core/widgets/container/custom_rounder_container.dart';

import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/text_style.dart';

class VisibilityStatusContainer extends StatelessWidget {
  const VisibilityStatusContainer({super.key, required this.visibility});
  final int visibility;

  @override
  Widget build(BuildContext context) {
    return CustomRounderContainer(
      showShadow: false,
      padding: EdgeInsets.symmetric(
        vertical: SizesConfig.xs,
        horizontal: SizesConfig.md,
      ),
      backgroundColor: (visibility == 0)
          ? AppColors.blue2.withOpacity(0.3)
          : AppColors.red2.withOpacity(0.3),
      child: Text(
        (visibility == 0) ? TextStrings.public : TextStrings.private,
        style: AppTextStyle.bodyXs(
          color: (visibility == 0) ? AppColors.blue2 : AppColors.red2,
        ),
      ),
    );
  }
}
