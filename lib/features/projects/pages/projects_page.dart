import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/functions/bloc_state_handling/app_bloc_state_handling.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';
import 'package:two_client_app/features/home/widgets/custom_text_field_for_home.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  void didChangeDependencies() {
    context.read<AppBloc>().add(GetProjectListEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesPath.pageBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: PaddingConfig.pagePadding,
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImagesPath.splash, height: 20),
                  PaddingConfig.w8,
                  Text(
                    TextStrings.myProjects,
                    style: AppTextStyle.headerSm(color: AppColors.cardColor),
                  ),
                ],
              ),
              PaddingConfig.h24,
              const CustomTextFieldForHome(
                height: 55,
                width: 340,
                bordercolor: AppColors.iconColor,
                textfield: AppColors.cardColor,
                text: TextStrings.searchYourProject,
                color: AppColors.navy2,
                prefix: Iconsax.search_normal_1,
                suffix: Iconsax.menu,
                textcolor: AppColors.iconColor,
                iconcolor: AppColors.iconColor,
              ),
              PaddingConfig.h16,
              Expanded(
                child: BlocBuilder<AppBloc, AppState>(
                  buildWhen: (previous, current) =>
                      previous.projectListStatus != current.projectListStatus,
                  builder: (context, state) {
                    return AppBlocStateHandling().showProjectList(state);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
