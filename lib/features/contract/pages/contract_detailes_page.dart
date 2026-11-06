import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/functions/helper_functions.dart';
import 'package:two_client_app/core/widgets/dialogs/sent_edit_contract_request_dialog.dart';
import 'package:two_client_app/features/app/data/models/single-models/contract_model.dart';
import 'package:two_client_app/features/contract/widgets/custom_contract_details_column.dart';
import 'package:two_client_app/features/contract/widgets/show_contract_details_column.dart';
import 'package:two_client_app/features/projects/widgets/custom_icon_with_text.dart';

class ContractDetailesPage extends StatelessWidget {
  const ContractDetailesPage({super.key, required this.contract});
  final ContractModel contract;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 120,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImagesPath.navyBackground),
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 0, bottom: 60),
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Iconsax.arrow_left,
              size: 30,
              color: AppColors.cardColor,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 60),
            child: IconButton(
              onPressed: () {},
              icon: PopupMenuButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                position: PopupMenuPosition.under,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      sentEditContractRequestDialog(context, contract.id);
                    },
                    child: CustomIconWithText(
                      color: AppColors.blue4,
                      icon: Iconsax.send_2,
                      text: TextStrings.editRequest,
                    ),
                  ),
                ],
                child: const Icon(Iconsax.more, color: AppColors.cardColor),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: PaddingConfig.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contract.project.projectType,
                    style: AppTextStyle.bodyMd(color: AppColors.blue2),
                  ),
                  PaddingConfig.h16,
                  Text(
                    HelperFunctions.getTimeAgo(contract.project.createdAt),
                    style: AppTextStyle.bodyMd(),
                  ),
                  PaddingConfig.h24,
                  Row(
                    children: [
                      const CustomContractDetailsColumn(),
                      PaddingConfig.w16,
                      ShowContractDetailsColumn(contractModel: contract),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
