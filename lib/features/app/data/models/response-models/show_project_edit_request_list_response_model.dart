import 'dart:convert';

import 'package:two_client_app/features/app/data/models/single-models/message_model.dart';

ShowProjectEditRequestListResponseModel
showProjectEditRequestListResponseModelFromJson(String str) =>
    ShowProjectEditRequestListResponseModel.fromJson(json.decode(str));

String showProjectEditRequestListResponseModelToJson(
  ShowProjectEditRequestListResponseModel data,
) => json.encode(data.toJson());

class ShowProjectEditRequestListResponseModel {
  final int status;
  final String msg;
  final List<MessageModel> data;

  ShowProjectEditRequestListResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowProjectEditRequestListResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ShowProjectEditRequestListResponseModel(
    status: json["status"],
    msg: json["msg"],
    data: List<MessageModel>.from(
      json["data"].map((x) => MessageModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
