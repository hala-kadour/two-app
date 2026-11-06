import 'package:flutter/material.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/features/auth/widgets/custom_google_githup_button.dart';
import 'package:two_client_app/features/auth/widgets/divider.dart';

class CustomGoogleGitHupColumn extends StatelessWidget {
  const CustomGoogleGitHupColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const widgetDivider(),
        PaddingConfig.h24,
        CustomGoogleGithupButton(
          image: IconsPath.google,
          text: 'Continue With Google',
          onpressed: () {},
        ),
        PaddingConfig.h16,
        CustomGoogleGithupButton(
          image: IconsPath.githup,
          text: 'Continue With GitHub',
          onpressed: () {},
        ),
      ],
    );
  }
}
