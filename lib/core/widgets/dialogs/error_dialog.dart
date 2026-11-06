import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:two_client_app/config/paths/assets_path.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';

void showErrorDialog(BuildContext context, String errorMessage) {
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
            borderRadius: BorderRadius.circular(20),
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
              const SizedBox(height: 20),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: AppTextStyle.buttonStyle(color: AppColors.red2),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  TextStrings.ok,
                  style: AppTextStyle.buttonStyle(color: AppColors.red2),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
