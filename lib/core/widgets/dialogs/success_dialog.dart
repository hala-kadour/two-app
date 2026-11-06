import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/widgets/buttons/elevated-button/main_green_button.dart';

void showSuccessDialog(BuildContext context, void Function() onpressed) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: SizesConfig.dialogWidthMd,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                JsonPath.success,
                width: 150,
                height: 150,
                repeat: true,
              ),
              PaddingConfig.h16,
              Text(
                TextStrings.sucess,
                style: AppTextStyle.bodyLg(color: AppColors.green3),
              ),
              PaddingConfig.h24,
              SizedBox(
                width: 250,
                child: MainGreenButton(
                  onpressed: onpressed,
                  text: TextStrings.ok,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
