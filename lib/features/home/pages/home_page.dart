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
import 'package:two_client_app/features/app/bloc/app_bloc.dart';
import 'package:two_client_app/features/home/widgets/custom_text_field_for_home.dart';
import 'package:two_client_app/features/home/widgets/home/see_all_text_button.dart';
import 'package:two_client_app/features/home/widgets/home/custom_home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    context.read<AppBloc>()
      ..add(GetUserHeader())
      ..add(GetUnreadNotificationEvent());
    context.read<AppBloc>().add(GetHomeProjectListEvent());
    context.read<AppBloc>().add(GetHomeContractEvent());
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
          child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(Duration(seconds: 2), () {
                context.read<AppBloc>().add(GetUnreadNotificationEvent());
                context.read<AppBloc>().add(GetHomeProjectListEvent());
                context.read<AppBloc>().add(GetHomeContractEvent());
              });
            },
            child: Column(
              children: [
                const CustomHomeHeader(),
                PaddingConfig.h16,
                CustomTextFieldForHome(
                  height: 55,
                  width: double.infinity,
                  bordercolor: AppColors.iconColor,
                  color: Colors.transparent,
                  textfield: AppColors.cardColor,
                  text: TextStrings.searchYourProject,
                  prefix: Iconsax.search_normal_1,
                  suffix: Iconsax.menu,
                  textcolor: AppColors.iconColor,
                  iconcolor: AppColors.iconColor,
                ),
                PaddingConfig.h16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TextStrings.resentProject,
                      style: AppTextStyle.headerSm(color: AppColors.white),
                    ),
                    SeeAllTextButton(
                      onpressed: () {
                        context.pushNamed(AppRouteConfig.recentproject);
                      },
                    ),
                  ],
                ),
                PaddingConfig.h8,
                Expanded(
                  flex: 8,
                  child: BlocBuilder<AppBloc, AppState>(
                    buildWhen: (previous, current) =>
                        previous.homeProjectListStatus !=
                        current.homeProjectListStatus,
                    builder: (context, state) {
                      return AppBlocStateHandling().getHomeProjectList(state);
                    },
                  ),
                ),
                PaddingConfig.h16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TextStrings.recentContract,
                      style: AppTextStyle.headerSm(color: AppColors.navy1),
                    ),
                    SeeAllTextButton(
                      onpressed: () {
                        context.pushNamed(AppRouteConfig.recentproject);
                      },
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) =>
                        AppBlocStateHandling().getHomeContractList(state),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
