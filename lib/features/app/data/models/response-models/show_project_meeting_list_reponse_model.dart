import 'dart:convert';

import 'package:two_client_app/features/app/data/models/single-models/meeting_model.dart';

ShowProjectMeetingListResponseModel showProjectMeetingListResponseModelFromJson(
  String str,
) => ShowProjectMeetingListResponseModel.fromJson(json.decode(str));

String showProjectMeetingListResponseModelToJson(
  ShowProjectMeetingListResponseModel data,
) => json.encode(data.toJson());

class ShowProjectMeetingListResponseModel {
  final int status;
  final String msg;
  final List<MeetingModel> data;

  ShowProjectMeetingListResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowProjectMeetingListResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ShowProjectMeetingListResponseModel(
    status: json["status"],
    msg: json["msg"],
    data: List<MeetingModel>.from(
      json["data"].map((x) => MeetingModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
