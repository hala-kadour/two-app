import 'package:flutter/material.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/core/widgets/container/custom_rounder_container.dart';

import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/text_style.dart';

class ContractApprovmentContainer extends StatelessWidget {
  const ContractApprovmentContainer({super.key, required this.sign});
  final int sign;

  @override
  Widget build(BuildContext context) {
    return CustomRounderContainer(
      showShadow: false,
      padding: EdgeInsets.symmetric(
        vertical: SizesConfig.xs,
        horizontal: SizesConfig.md,
      ),
      backgroundColor: (sign == 0)
          ? AppColors.yellow2.withOpacity(0.3)
          : AppColors.blue2.withOpacity(0.3),
      child: Text(
        (sign == 0) ? TextStrings.notApproved : TextStrings.approved,
        style: AppTextStyle.bodyXs(
          color: (sign == 0) ? AppColors.yellow2 : AppColors.blue2,
        ),
      ),
    );
  }
}
