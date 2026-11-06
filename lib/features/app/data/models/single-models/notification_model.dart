import 'package:two_client_app/features/app/data/models/single-models/project.dart';

class NotificationModel {
  final String id;
  final String message;
  final int projectId;
  final Project project;

  NotificationModel({
    required this.id,
    required this.message,
    required this.projectId,
    required this.project,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        message: json["message"],
        projectId: json["project_id"],
        project: Project.fromJson(json["project"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "project_id": projectId,
    "project": project.toJson(),
  };
}
