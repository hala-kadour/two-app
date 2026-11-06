import 'package:two_client_app/features/app/data/models/single-models/project.dart';

class ContractModel {
  final int id;
  final String contract;
  final int contractManagerStatus;
  final int projectManagerStatus;
  final int status;
  final String? clientEditRequest;
  final int needEdit;
  final int adminSign;
  final Project project;

  ContractModel({
    required this.id,
    required this.contract,
    required this.contractManagerStatus,
    required this.projectManagerStatus,
    required this.status,
    required this.clientEditRequest,
    required this.needEdit,
    required this.adminSign,
    required this.project,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) => ContractModel(
    id: json["id"],
    contract: json["contract"],
    contractManagerStatus: json["contract_manager_status"],
    projectManagerStatus: json["project_manager_status"],
    status: json["status"],
    clientEditRequest: json["client_edit_request"] ?? "",
    needEdit: json["need_edit"],
    adminSign: json["admin_sign"],
    project: Project.fromJson(json["project"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "contract": contract,
    "contract_manager_status": contractManagerStatus,
    "project_manager_status": projectManagerStatus,
    "status": status,
    "client_edit_request": clientEditRequest,
    "need_edit": needEdit,
    "admin_sign": adminSign,
    "project": project.toJson(),
  };
}
