class Project {
  final int id;
  final String projectType;
  final String projectDescription;
  final List<String> requirements;
  final String document;
  final String cooperationType;
  final String contactTime;
  final int clientId;
  final int teamId;
  final int teamApproved;
  final String status;
  final int private;
  final DateTime createdAt;
  final DateTime updatedAt;

  Project({
    required this.id,
    required this.projectType,
    required this.projectDescription,
    required this.requirements,
    required this.document,
    required this.cooperationType,
    required this.contactTime,
    required this.clientId,
    required this.teamId,
    required this.teamApproved,
    required this.status,
    required this.private,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"],
    projectType: json["project_type"],
    projectDescription: json["project_description"],
    requirements: List<String>.from(json["requirements"].map((x) => x)),
    document: json["document"],
    cooperationType: json["cooperation_type"],
    contactTime: json["contact_time"],
    clientId: json["client_id"],
    teamId: json["team_id"],
    teamApproved: json["team_approved"],
    status: json["status"],
    private: json["private"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_type": projectType,
    "project_description": projectDescription,
    "requirements": List<dynamic>.from(requirements.map((x) => x)),
    "document": document,
    "cooperation_type": cooperationType,
    "contact_time": contactTime,
    "client_id": clientId,
    "team_id": teamId,
    "team_approved": teamApproved,
    "status": status,
    "private": private,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
