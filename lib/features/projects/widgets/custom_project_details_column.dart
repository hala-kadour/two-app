import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/features/projects/widgets/custom_icon_with_text.dart';

class CustomProjectDetailsColumn extends StatelessWidget {
  const CustomProjectDetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.user,
          text: TextStrings.client,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.user,
          text: TextStrings.manager,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.profile_2user,
          text: TextStrings.team,
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
          icon: Iconsax.clipboard,
          text: TextStrings.cooperation,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.document_text_1,
          text: TextStrings.attachment,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.eye_slash,
          text: TextStrings.visibility,
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.black,
          icon: Iconsax.document_text_1,
          text: TextStrings.contract,
        ),
      ],
    );
  }
}
