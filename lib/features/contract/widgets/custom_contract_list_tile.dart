import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/routes/app_route_config.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/widgets/container/contract_approvment_container.dart';
import 'package:two_client_app/core/widgets/container/contract_status_container.dart';
import 'package:two_client_app/core/widgets/container/need_edit_contrainer.dart';
import 'package:two_client_app/features/app/data/models/single-models/contract_model.dart';

class CustomContractListTile extends StatelessWidget {
  const CustomContractListTile({super.key, required this.contract});
  final ContractModel contract;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.pushNamed(AppRouteConfig.contractDetails, extra: contract),
      child: Card(
        elevation: 10,
        shadowColor: AppColors.fontLightColor.withOpacity(0.4),
        color: AppColors.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: AppColors.gray1,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          "PDF",
                          style: AppTextStyle.bodyMd(
                            color: AppColors.iconColor,
                          ),
                        ),
                      ),
                      PaddingConfig.w8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contract.contract,
                            style: AppTextStyle.bodySm(color: AppColors.blue2),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Iconsax.more),
                ],
              ),
              PaddingConfig.h8,
              Row(
                children: [
                  ContractStatusContainer(status: contract.status),
                  PaddingConfig.w8,
                  ContractApprovmentContainer(
                    sign: contract.contractManagerStatus,
                  ),
                  if (contract.needEdit == 1) PaddingConfig.w8,
                  if (contract.needEdit == 1) NeedEditContrainer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
