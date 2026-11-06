class MeetingModel {
  final int id;
  final DateTime date;
  final String meetingType;
  final int projectId;
  final DateTime createdAt;
  final DateTime updatedAt;

  MeetingModel({
    required this.id,
    required this.date,
    required this.meetingType,
    required this.projectId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) => MeetingModel(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    meetingType: json["meeting_type"],
    projectId: json["project_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "meeting_type": meetingType,
    "project_id": projectId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
