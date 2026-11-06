import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/routes/app_route_config.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/functions/bloc_state_handling/app_bloc_state_handling.dart';
import 'package:two_client_app/core/widgets/dialogs/rating_project_dialog.dart';
import 'package:two_client_app/core/widgets/dialogs/sent_edit_project_request_dialog.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';
import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';
import 'package:two_client_app/features/projects/widgets/custom_project_details_column.dart';
import 'package:two_client_app/features/projects/widgets/shown_project_details_column.dart';
import 'package:two_client_app/features/projects/widgets/custom_icon_with_text.dart';

class ProjectDetailesPage extends StatelessWidget {
  const ProjectDetailesPage({super.key, required this.projectModel});
  final ProjectModel projectModel;

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
            child: BlocListener<AppBloc, AppState>(
              listenWhen: (previous, current) =>
                  (previous.rateProjectStatus != current.rateProjectStatus) ||
                  (previous.sentEditProjectRequestStatus !=
                      current.sentEditProjectRequestStatus),
              listener: (context, state) {
                AppBlocStateHandling().rateProject(state, context);
                AppBlocStateHandling().sentEditProjectRequest(state, context);
              },
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
                      onTap: () =>
                          showProjectRatingDialog(context, projectModel.id),
                      child: CustomIconWithText(
                        color: AppColors.yellow2,
                        icon: Iconsax.star,
                        text: TextStrings.rateProject,
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => context.pushNamed(
                        AppRouteConfig.updateProject,
                        extra: projectModel,
                      ),
                      child: CustomIconWithText(
                        color: AppColors.blue4,
                        icon: Iconsax.brush_4,
                        text: TextStrings.editProject,
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => context.pushNamed(
                        AppRouteConfig.projectMeetings,
                        extra: projectModel.id,
                      ),
                      child: CustomIconWithText(
                        color: AppColors.black,
                        icon: Iconsax.calendar_1,
                        text: TextStrings.viewMeeting,
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => context.pushNamed(
                        AppRouteConfig.projectEditRequests,
                        extra: projectModel.id,
                      ),
                      child: CustomIconWithText(
                        color: AppColors.black,
                        icon: Iconsax.direct_inbox,
                        text: TextStrings.viewEditRequests,
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => sentEditProjectRequestDialog(
                        context,
                        projectModel.id,
                      ),
                      child: CustomIconWithText(
                        color: AppColors.black,
                        icon: Iconsax.send_2,
                        text: TextStrings.sentEditMessage,
                      ),
                    ),
                  ],
                  child: const Icon(Iconsax.more, color: AppColors.cardColor),
                ),
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
                    projectModel.projectType,
                    style: AppTextStyle.bodyMd(color: AppColors.blue2),
                  ),
                  PaddingConfig.h16,
                  Text(
                    projectModel.projectDescription,
                    style: AppTextStyle.bodyMd(),
                  ),
                  PaddingConfig.h16,
                  Text(
                    projectModel.requirements.join(', '),
                    style: AppTextStyle.bodySm(),
                  ),
                  PaddingConfig.h24,
                  Row(
                    children: [
                      const CustomProjectDetailsColumn(),
                      PaddingConfig.w16,
                      ShownProjectDetailsColumn(projectModel: projectModel),
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
