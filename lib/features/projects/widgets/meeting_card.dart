import 'package:flutter/material.dart';
import 'package:two_client_app/config/constants/padding_config.dart';
import 'package:two_client_app/config/paths/text_strings.dart';
import 'package:two_client_app/config/theme/color.dart';
import 'package:two_client_app/config/theme/text_style.dart';
import 'package:two_client_app/core/functions/helper_functions.dart';
import 'package:two_client_app/features/app/data/models/single-models/meeting_model.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({super.key, required this.meetingModel});
  final MeetingModel meetingModel;

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
                    color: AppColors.pink1.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "M",
                    style: AppTextStyle.headerMd(color: AppColors.pink1),
                  ),
                ),
                PaddingConfig.w16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PaddingConfig.h8,
                    Text(
                      "🗓️ ${TextStrings.projectMeeting} ${meetingModel.meetingType}",
                      style: AppTextStyle.bodySm(),
                    ),
                    PaddingConfig.h8,
                    SizedBox(
                      width: 200,
                      child: Text(
                        "${TextStrings.createdAt} ${HelperFunctions.getTimeAgo(meetingModel.createdAt)},${TextStrings.updatedAt}   ${HelperFunctions.getTimeAgo(meetingModel.updatedAt)}",
                        overflow: TextOverflow.fade,
                        style: AppTextStyle.bodyXs(
                          color: AppColors.fontLightColor,
                        ),
                      ),
                    ),
                    PaddingConfig.h16,
                    SizedBox(
                      width: 200,
                      child: Text(
                        "${TextStrings.leftTime}  ${HelperFunctions.getDurationText(DateTime.now(), meetingModel.date)}",
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
