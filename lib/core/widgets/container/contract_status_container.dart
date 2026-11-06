import 'package:flutter/material.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/core/widgets/container/custom_rounder_container.dart';

import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/text_style.dart';

class ContractStatusContainer extends StatelessWidget {
  const ContractStatusContainer({super.key, required this.status});
  final int status;

  @override
  Widget build(BuildContext context) {
    return CustomRounderContainer(
      showShadow: false,
      padding: EdgeInsets.symmetric(
        vertical: SizesConfig.xs,
        horizontal: SizesConfig.md,
      ),
      backgroundColor: (status == 0)
          ? AppColors.red2.withOpacity(0.3)
          : AppColors.green4.withOpacity(0.3),
      child: Text(
        (status == 0) ? TextStrings.notSigned : TextStrings.signed,
        style: AppTextStyle.bodyXs(
          color: (status == 0) ? AppColors.red2 : AppColors.green4,
        ),
      ),
    );
  }
}
