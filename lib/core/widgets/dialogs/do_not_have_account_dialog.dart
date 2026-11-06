import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

void doNotHaveAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                JsonPath.error,
                width: 120,
                height: 120,
                repeat: false,
              ),
              PaddingConfig.h16,
              Text(
                "You Do't Have An Acount!",
                textAlign: TextAlign.center,
                style: AppTextStyle.buttonStyle(color: AppColors.red2),
              ),
              PaddingConfig.h8,
              Text(
                "please make an account first.",
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyMd(color: AppColors.fontLightColor),
              ),
              PaddingConfig.h24,
            ],
          ),
        ),
      );
    },
  );
}
