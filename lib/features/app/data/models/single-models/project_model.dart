class ProjectModel {
  final int id;
  final String projectType;
  final String projectDescription;
  final List<String> requirements;
  final String document;
  final String cooperationType;
  final String contactTime;
  final int private;
  final Contract? contract;
  final String status;
  final Team? team;

  ProjectModel({
    required this.id,
    required this.projectType,
    required this.projectDescription,
    required this.requirements,
    required this.document,
    required this.cooperationType,
    required this.contactTime,
    required this.private,
    required this.contract,
    required this.status,
    required this.team,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    id: json["id"],
    projectType: json["project_type"],
    projectDescription: json["project_description"],
    requirements: List<String>.from(json["requirements"].map((x) => x)),
    document: json["document"],
    cooperationType: json["cooperation_type"],
    contactTime: json["contact_time"],
    private: json["private"],
    contract: json["contract"] != null
        ? Contract.fromJson(json["contract"])
        : null,
    status: json["status"],
    team: json["team"] != null ? Team.fromJson(json["team"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_type": projectType,
    "project_description": projectDescription,
    "requirements": List<dynamic>.from(requirements.map((x) => x)),
    "document": document,
    "cooperation_type": cooperationType,
    "contact_time": contactTime,
    "private": private,
    "contract": contract?.toJson(),
    "status": status,
    "team": team?.toJson(),
  };
}

class Team {
  final int id;
  final String name;
  final List<Member> members;

  Team({required this.id, required this.name, required this.members});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
  };
}

class Member {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String role;
  final bool isManager;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.role,
    required this.isManager,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    role: json["role"],
    isManager: json["is_manager"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "role": role,
    "is_manager": isManager,
  };
}

class Contract {
  final int id;
  final String contract;
  final int projectId;
  final int contractManagerStatus;
  final int projectManagerStatus;
  final dynamic clientSign;
  final int status;
  final dynamic clientEditRequest;
  final int needEdit;
  final int adminSign;
  final DateTime createdAt;
  final DateTime updatedAt;

  Contract({
    required this.id,
    required this.contract,
    required this.projectId,
    required this.contractManagerStatus,
    required this.projectManagerStatus,
    required this.clientSign,
    required this.status,
    required this.clientEditRequest,
    required this.needEdit,
    required this.adminSign,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
    id: json["id"],
    contract: json["contract"],
    projectId: json["project_id"],
    contractManagerStatus: json["contract_manager_status"],
    projectManagerStatus: json["project_manager_status"],
    clientSign: json["client_sign"],
    status: json["status"],
    clientEditRequest: json["client_edit_request"],
    needEdit: json["need_edit"],
    adminSign: json["admin_sign"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "contract": contract,
    "project_id": projectId,
    "contract_manager_status": contractManagerStatus,
    "project_manager_status": projectManagerStatus,
    "client_sign": clientSign,
    "status": status,
    "client_edit_request": clientEditRequest,
    "need_edit": needEdit,
    "admin_sign": adminSign,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
