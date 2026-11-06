import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/core/widgets/buttons/text-button/cancel_text_button.dart';
import 'package:two_client_app/core/widgets/buttons/text-button/confirm_text_button.dart';
import 'package:two_client_app/features/app/bloc/app_bloc.dart';

Future<void> showProjectRatingDialog(
  BuildContext context,
  int projectId,
) async {
  double rating = 5;
  IconData icon = Icons.sentiment_neutral;

  void updateIcon(double value) {
    if (value < 4) {
      icon = Icons.sentiment_very_dissatisfied; // حزين
    } else if (value < 7) {
      icon = Icons.sentiment_neutral; // أوكيه
    } else {
      icon = Icons.sentiment_very_satisfied; // مبسوط
    }
  }

  updateIcon(rating);

  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text(
              TextStrings.rateTheProject,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 60, color: AppColors.blue2),
                const SizedBox(height: 16),
                Slider(
                  value: rating,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  activeColor: AppColors.blue2,
                  label: rating.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                      updateIcon(value);
                    });
                  },
                ),
                Text(
                  "${TextStrings.rating} ${rating.round()} / 10",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            actions: [
              CancelTextButton(),
              ConfirmTextButton(
                onPressed: () {
                  context.read<AppBloc>().add(
                    RateProjectEvent(
                      projectId: projectId,
                      rating: int.parse(rating.toString()),
                    ),
                  );
                  context.pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}
