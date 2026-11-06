import 'dart:convert';

import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';

ShowProjectListResponseModel showProjectListResponseModelFromJson(String str) =>
    ShowProjectListResponseModel.fromJson(json.decode(str));

String showProjectListResponseModelToJson(ShowProjectListResponseModel data) =>
    json.encode(data.toJson());

class ShowProjectListResponseModel {
  final int status;
  final String msg;
  final List<ProjectModel> data;

  ShowProjectListResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowProjectListResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowProjectListResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<ProjectModel>.from(
          json["data"].map((x) => ProjectModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
