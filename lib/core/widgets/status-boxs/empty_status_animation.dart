import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class EmptyStatusAnimation extends StatelessWidget {
  const EmptyStatusAnimation({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width ?? 200,
          height: height ?? 200,
          child: Lottie.asset(JsonPath.noData),
        ),
        PaddingConfig.w16,
        Text(
          TextStrings.noData,
          style: AppTextStyle.bodySm(color: AppColors.red2),
        ),
      ],
    );
  }
}
