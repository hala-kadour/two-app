import 'dart:convert';

import 'package:two_client_app/features/app/data/models/single-models/notification_model.dart';

ShowUnreadNotificationResponseModel showUnreadNotificationResponseModelFromJson(
  String str,
) => ShowUnreadNotificationResponseModel.fromJson(json.decode(str));

String showUnreadNotificationResponseModelToJson(
  ShowUnreadNotificationResponseModel data,
) => json.encode(data.toJson());

class ShowUnreadNotificationResponseModel {
  final int status;
  final String msg;
  final List<NotificationModel> data;

  ShowUnreadNotificationResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowUnreadNotificationResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ShowUnreadNotificationResponseModel(
    status: json["status"],
    msg: json["msg"],
    data: List<NotificationModel>.from(
      json["data"].map((x) => NotificationModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
