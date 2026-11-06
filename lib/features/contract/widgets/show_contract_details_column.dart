import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/routes/app_route_config.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/features/app/data/models/single-models/contract_model.dart';

class ShowContractDetailsColumn extends StatelessWidget {
  const ShowContractDetailsColumn({super.key, required this.contractModel});
  final ContractModel contractModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomBlueContainer(text: contractModel.contract),
            PaddingConfig.w8,
            InkWell(
              onTap: () => context.pushNamed(
                AppRouteConfig.pdfViewer,
                pathParameters: ({
                  'pdfUrl': contractModel.contract,
                  'id': contractModel.id.toString(),
                }),
              ),
              child: ViewButton(),
            ),
          ],
        ),
        PaddingConfig.h16,
        CustomBlueContainer(
          text: (contractModel.contractManagerStatus == 0)
              ? TextStrings.notApproved
              : TextStrings.approved,
          isOpsite: (contractModel.contractManagerStatus == 0) ? true : false,
        ),
        PaddingConfig.h16,
        CustomBlueContainer(
          text: (contractModel.projectManagerStatus == 0)
              ? TextStrings.notApproved
              : TextStrings.approved,
          isOpsite: (contractModel.projectManagerStatus == 0) ? true : false,
        ),
        PaddingConfig.h16,
        CustomBlueContainer(
          text: (contractModel.status == 0)
              ? TextStrings.notSigned
              : TextStrings.signed,
          isOpsite: (contractModel.status == 0) ? true : false,
        ),
        PaddingConfig.h16,
        CustomBlueContainer(
          text: (contractModel.needEdit == 0)
              ? TextStrings.no
              : TextStrings.yes,
          isOpsite: (contractModel.needEdit == 1) ? true : false,
        ),
        PaddingConfig.h16,
        CustomBlueContainer(
          text: (contractModel.adminSign == 0)
              ? TextStrings.notSigned
              : TextStrings.signed,
          isOpsite: (contractModel.adminSign == 0) ? true : false,
        ),
        PaddingConfig.h16,
        CustomText(text: contractModel.clientEditRequest ?? TextStrings.empty),
      ],
    );
  }
}

class ViewButton extends StatelessWidget {
  const ViewButton({super.key});

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
          Text('View', style: AppTextStyle.bodyXs(color: AppColors.cardColor)),
          PaddingConfig.w8,
          const Icon(Iconsax.eye, color: AppColors.cardColor, size: 12),
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
    this.isOpsite = false,
  });

  final String text;
  final double width;
  final bool hasIcon;
  final bool isOpsite;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isOpsite
            ? AppColors.red2.withOpacity(0.3)
            : AppColors.blue2.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: hasIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.document_text_1,
                  color: isOpsite ? AppColors.red2 : AppColors.blue2,
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
              style: AppTextStyle.bodyXs(
                color: isOpsite ? AppColors.red2 : AppColors.blue2,
              ),
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
