import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/widgets/container/visibility_status_container.dart';
import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';
import 'package:two_client_app/features/projects/widgets/custom_image_circle.dart';

class ShownProjectDetailsColumn extends StatelessWidget {
  const ShownProjectDetailsColumn({super.key, required this.projectModel});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    final manangerList = projectModel.team?.members.where(
      (element) => element.isManager == true,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CustomImageCircle(imagePath: ImagesPath.profile),
            PaddingConfig.w8,
            Text(
              TextStrings.you,
              style: AppTextStyle.bodySm(color: AppColors.iconColor),
            ),
          ],
        ),
        PaddingConfig.h16,
        Row(
          children: [
            const CustomImageCircle(imagePath: ImagesPath.profile),
            PaddingConfig.w8,
            CustomText(text: manangerList?.first.name ?? "No leader"),
          ],
        ),
        PaddingConfig.h16,
        CustomText(text: projectModel.team?.name ?? "No Team"),
        PaddingConfig.h16,
        CustomBlueContainer(text: projectModel.status),
        PaddingConfig.h16,
        PaddingConfig.h16,
        CustomBlueContainer(text: projectModel.cooperationType, width: 200),
        PaddingConfig.h16,
        CustomBlueContainer(
          text: projectModel.document,
          width: 200,
          hasIcon: true,
        ),
        PaddingConfig.h16,
        VisibilityStatusContainer(visibility: projectModel.private),
        PaddingConfig.h16,
        Row(
          children: [
            CustomBlueContainer(
              text: projectModel.contract?.contract ?? "No Contact",
            ),
            PaddingConfig.w8,
            ChangeButton(),
          ],
        ),
      ],
    );
  }
}

class ChangeButton extends StatelessWidget {
  const ChangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      height: 25,
      decoration: BoxDecoration(
        color: AppColors.blue2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          PaddingConfig.w8,
          Text(
            'Change',
            style: AppTextStyle.bodyXs(color: AppColors.cardColor),
          ),
          PaddingConfig.w8,
          const Icon(Iconsax.edit_24, color: AppColors.cardColor, size: 12),
        ],
      ),
    );
  }
}

class CustomBlueContainer extends StatelessWidget {
  const CustomBlueContainer({
    super.key,
    required this.text,
    this.width = 100,
    this.hasIcon = false,
  });

  final String text;
  final double width;
  final bool hasIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.blue2.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: hasIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.document_text_1,
                  color: AppColors.blue2,
                  size: 15,
                ),
                PaddingConfig.w4,
                SizedBox(
                  width: width * 0.8,
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bodyXs(color: AppColors.blue2),
                  ),
                ),
              ],
            )
          : Text(
              text,
              style: AppTextStyle.bodyXs(color: AppColors.blue2),
              overflow: TextOverflow.ellipsis,
            ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyle.bodySm(color: AppColors.iconColor));
  }
}
