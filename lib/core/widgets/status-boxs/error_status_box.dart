import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class ErrorStatusBox extends StatelessWidget {
  const ErrorStatusBox({
    super.key,
    required this.errorMessage,
    this.width,
    this.height,
  });
  final String errorMessage;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          JsonPath.error,
          width: width ?? 150,
          height: height ?? 150,
          repeat: true,
        ),
        const SizedBox(height: 20),
        Text(
          errorMessage,
          style: AppTextStyle.buttonStyle(color: AppColors.red2),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
