import 'package:flutter/material.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/core/widgets/container/custom_rounder_container.dart';

import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/text_style.dart';

class NeedEditContrainer extends StatelessWidget {
  const NeedEditContrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRounderContainer(
      showShadow: false,
      padding: EdgeInsets.symmetric(
        vertical: SizesConfig.xs,
        horizontal: SizesConfig.md,
      ),
      backgroundColor: AppColors.yellow2.withOpacity(0.3),
      child: Text(
        TextStrings.need,
        style: AppTextStyle.bodyXs(color: AppColors.yellow2),
      ),
    );
  }
}
