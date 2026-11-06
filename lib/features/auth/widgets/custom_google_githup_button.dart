import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

class CustomGoogleGithupButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onpressed;
  const CustomGoogleGithupButton({
    required this.image,
    required this.text,
    required this.onpressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: const Size(2222, 50),
        backgroundColor: Colors.transparent,
        side: const BorderSide(color: AppColors.gray1, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizesConfig.buttonRadius),
        ),
      ),
      onPressed: onpressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          const SizedBox(width: 10),
          Text(text, style: AppTextStyle.bodySm()),
        ],
      ),
    );
  }
}
