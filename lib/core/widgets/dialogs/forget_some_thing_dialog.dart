import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/widgets/buttons/elevated-button/main_gray_button.dart';

void forgetSomeThingDialog(BuildContext context, String thing) {
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
                JsonPath.noData,
                width: 120,
                height: 120,
                repeat: false,
              ),
              PaddingConfig.h16,
              Text(
                "${TextStrings.youforgotToAdd} $thing",
                textAlign: TextAlign.center,
                style: AppTextStyle.headerSm(color: AppColors.red2),
              ),
              PaddingConfig.h24,
              MainGrayButton(
                text: TextStrings.close,
                onpressed: () => context.pop(),
              ),
            ],
          ),
        ),
      );
    },
  );
}
