import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/routes/app_route_config.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/widgets/container/dynamic_status_container.dart';
import 'package:two_client_app/core/widgets/container/visibility_status_container.dart';
import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';

class CustomProjectCard extends StatelessWidget {
  const CustomProjectCard({required this.projectModel, super.key});
  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        AppRouteConfig.projectDetailes,
        extra: projectModel,
      ),
      child: SizedBox(
        width: 400,
        child: Card(
          elevation: 8,
          shadowColor: AppColors.fontLightColor.withOpacity(0.4),
          color: AppColors.cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8.0),
                      child: SizedBox(
                        height: 140,
                        width: 400,
                        child: Image.asset(
                          ImagesPath.navyBackground,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                      child: Container(
                        width: 100,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.cardColor.withOpacity(0.4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              projectModel.projectType,
                              style: AppTextStyle.bodySm(
                                color: AppColors.cardColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                PaddingConfig.h16,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      TextStrings.createdBy,
                      style: AppTextStyle.bodySm(
                        color: AppColors.fontLightColor,
                      ),
                    ),
                    PaddingConfig.w8,
                    Text(TextStrings.you, style: AppTextStyle.bodyXs()),
                    PaddingConfig.w16,
                  ],
                ),
                PaddingConfig.h8,
                Row(
                  children: [
                    DynamicStatusContainer(status: projectModel.status),
                    PaddingConfig.w8,
                    VisibilityStatusContainer(visibility: projectModel.private),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
