import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/widgets/buttons/icon-button/custom_filter_button.dart';
import 'package:two_client_app/features/home/widgets/filters/custom_toggle_container_for_filter.dart';
import 'package:two_client_app/features/home/widgets/filters/custom_filter_option_text.dart';

class ProjectFilterDialog extends StatelessWidget {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            actionsPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: const SizedBox(height: 0, width: 300),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Filter by :', style: AppTextStyle.bodyMd()),
                const SizedBox(height: 10),
                const CustomFilterOptionText(text: 'status'),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomToggleContainerForFilter(text: 'Completed'),
                    CustomToggleContainerForFilter(text: 'In-Progress'),
                    CustomToggleContainerForFilter(text: 'Canceled'),
                  ],
                ),
                const SizedBox(height: 30),
                const CustomFilterOptionText(text: 'rate'),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    CustomToggleContainerForFilter(text: 'From-Highest'),
                    SizedBox(width: 10),
                    CustomToggleContainerForFilter(text: 'From-Lowest'),
                  ],
                ),
                const SizedBox(height: 30),
                const CustomFilterOptionText(text: 'name'),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    CustomToggleContainerForFilter(text: 'Ascending'),
                    SizedBox(width: 10),
                    CustomToggleContainerForFilter(text: 'Descending'),
                  ],
                ),
                const SizedBox(height: 30),
                const CustomFilterOptionText(text: 'date'),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    CustomToggleContainerForFilter(text: 'From-Latest'),
                    SizedBox(width: 10),
                    CustomToggleContainerForFilter(text: 'From-Oldest'),
                  ],
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Apply',
                        style: AppTextStyle.bodyMd(color: AppColors.green3),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: AppTextStyle.bodyMd(
                          color: AppColors.fontLightColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  const ProjectFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFilterButton(onTap: () => _showDialog(context));
  }
}
