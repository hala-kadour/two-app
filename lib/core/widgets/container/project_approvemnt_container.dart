import 'package:flutter/material.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/core/widgets/container/custom_rounder_container.dart';

import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/text_style.dart';

class ProjectApprovemntContainer extends StatelessWidget {
  const ProjectApprovemntContainer({super.key, required this.approvement});
  final int approvement;

  @override
  Widget build(BuildContext context) {
    return CustomRounderContainer(
      showShadow: false,
      padding: EdgeInsets.symmetric(
        vertical: SizesConfig.xs,
        horizontal: SizesConfig.md,
      ),
      backgroundColor: (approvement == 1)
          ? AppColors.green3.withOpacity(0.3)
          : AppColors.red2.withOpacity(0.3),
      child: Text(
        (approvement == 1) ? TextStrings.approved : TextStrings.rejected,
        style: AppTextStyle.bodyXs(
          color: (approvement == 1) ? AppColors.green3 : AppColors.red2,
        ),
      ),
    );
  }
}
