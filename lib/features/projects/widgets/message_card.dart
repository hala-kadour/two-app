import 'package:flutter/material.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/features/app/data/models/single-models/message_model.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: AppColors.fontLightColor.withOpacity(0.4),
      color: AppColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: AppColors.blue2.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "M",
                    style: AppTextStyle.headerMd(color: AppColors.blue2),
                  ),
                ),
                PaddingConfig.w16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PaddingConfig.h8,
                    Text(
                      "${TextStrings.newEditRequestMessage}  📩",
                      style: AppTextStyle.bodySm(),
                    ),
                    PaddingConfig.h8,
                    SizedBox(
                      width: 200,
                      child: Text(
                        messageModel.message,
                        overflow: TextOverflow.fade,
                        style: AppTextStyle.bodySm(),
                      ),
                    ),
                    PaddingConfig.h8,
                  ],
                ),
              ],
            ),
            PaddingConfig.h16,
          ],
        ),
      ),
    );
  }
}
