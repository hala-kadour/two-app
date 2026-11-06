import 'dart:convert';

import 'package:two_client_app/features/app/data/models/single-models/notification_model.dart';

ShowNotificationResponseModel showNotificationResponseModelFromJson(
  String str,
) => ShowNotificationResponseModel.fromJson(json.decode(str));

String showNotificationResponseModelToJson(
  ShowNotificationResponseModel data,
) => json.encode(data.toJson());

class ShowNotificationResponseModel {
  final int status;
  final String msg;
  final NotificationModel data;

  ShowNotificationResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowNotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowNotificationResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: NotificationModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data.toJson(),
  };
}
