import 'package:flutter/material.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class MainGreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final double? width;
  const MainGreenButton({
    required this.text,
    required this.onpressed,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 350,
      height: 50,
      decoration: BoxDecoration(
        gradient: AppColors.buttonColor,
        borderRadius: BorderRadius.circular(SizesConfig.buttonRadius),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: Colors.transparent),
        ),
        onPressed: onpressed,
        child: Text(
          text,
          style: AppTextStyle.buttonStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
