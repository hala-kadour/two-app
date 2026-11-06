import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/functions/bloc_state_handling/app_bloc_state_handling.dart';
import 'package:two_client_app/core/widgets/dialogs/logout_dialog.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void didChangeDependencies() {
    context.read<AppBloc>().add(GetUserProfileEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> nitifiOn = ValueNotifier(true);

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
                    TextStrings.profile,
                    style: AppTextStyle.headerSm(color: AppColors.cardColor),
                  ),
                ],
              ),
              PaddingConfig.h16,
              BlocBuilder<AppBloc, AppState>(
                buildWhen: (previous, current) =>
                    previous.userProfileStatus != current.userProfileStatus,
                builder: (context, state) =>
                    AppBlocStateHandling().getUserProfile(state),
              ),
              PaddingConfig.h48,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Language Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Iconsax.language_square,
                            size: SizesConfig.iconsMd,
                          ),
                          PaddingConfig.w8,
                          Text("Language", style: AppTextStyle.bodyMd()),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Iconsax.arrow_right_34,
                          size: SizesConfig.iconsMd,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Choose Language"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      title: const Text("English"),
                                      onTap: () {
                                        context.setLocale(const Locale('en'));
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: const Text("العربية"),
                                      onTap: () {
                                        context.setLocale(const Locale('ar'));
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),

                  PaddingConfig.h8,

                  /// Notifications Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Iconsax.notification, size: SizesConfig.iconsMd),
                          PaddingConfig.w8,
                          Text(
                            TextStrings.notifi,
                            style: AppTextStyle.bodyMd(),
                          ),
                        ],
                      ),
                      ValueListenableBuilder(
                        valueListenable: nitifiOn,
                        builder: (context, value, child) => Switch(
                          activeColor: AppColors.blue2,
                          value: value,
                          onChanged: (value) {
                            nitifiOn.value = value;
                          },
                        ),
                      ),
                    ],
                  ),

                  PaddingConfig.h24,

                  /// Logout Row
                  BlocListener<AppBloc, AppState>(
                    listener: (context, state) {
                      AppBlocStateHandling().logoutStateHandling(
                        state,
                        context,
                      );
                    },
                    listenWhen: (previous, current) =>
                        previous.logoutStatus != current.logoutStatus,
                    child: GestureDetector(
                      onTap: () => showLogoutDialog(context),
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.logout,
                            size: SizesConfig.iconsMd,
                            color: AppColors.red2,
                          ),
                          PaddingConfig.w8,
                          Text(
                            TextStrings.logout.tr(),
                            style: AppTextStyle.bodyMd(color: AppColors.red2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
