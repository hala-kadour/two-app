import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/features/projects/widgets/custom_icon_with_text.dart';

class CustomContractDetailsColumn extends StatelessWidget {
  const CustomContractDetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.document_text_1,
          text: TextStrings.contract,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.clipboard_tick,
          text: TextStrings.cmApprovement,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.clipboard_tick,
          text: TextStrings.pmApprovement,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.tick_square,
          text: TextStrings.status,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.edit,
          text: TextStrings.needEdit,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.signpost,
          text: TextStrings.adminSign,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.document_text_1,
          text: TextStrings.editRequest,
        ),
      ],
    );
  }
}
