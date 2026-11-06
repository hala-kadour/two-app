import 'dart:convert';

import 'package:two_client_app/features/app/data/models/single-models/contract_model.dart';

ShowContractListResponseModel showContractListResponseModelFromJson(
  String str,
) => ShowContractListResponseModel.fromJson(json.decode(str));

String showContractListResponseModelToJson(
  ShowContractListResponseModel data,
) => json.encode(data.toJson());

class ShowContractListResponseModel {
  final int status;
  final String msg;
  final List<ContractModel> data;

  ShowContractListResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowContractListResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowContractListResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<ContractModel>.from(
          json["data"].map((x) => ContractModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
