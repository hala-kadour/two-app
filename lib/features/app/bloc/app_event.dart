// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

class AppEvent {}

// Login Page
class LoginEvent extends AppEvent {
  String email;
  String password;
  LoginEvent({required this.email, required this.password});
}

// Notification Page
class GetNotificationEvent extends AppEvent {
  final String id;

  GetNotificationEvent({required this.id});
}

class GetUnreadNotificationEvent extends AppEvent {}

// Home Page
class GetUserHeader extends AppEvent {}

class GetHomeProjectListEvent extends AppEvent {}

class GetHomeContractEvent extends AppEvent {
  int? statusFilter;
  GetHomeContractEvent({this.statusFilter = 0});
}

// Project Page
class GetProjectListEvent extends AppEvent {}

class SentEditProjectRequestEvent extends AppEvent {
  int projectId;
  String editMessage;
  SentEditProjectRequestEvent({
    required this.projectId,
    required this.editMessage,
  });
}

class ShowProjectEditRequestsEvent extends AppEvent {
  int projectId;
  ShowProjectEditRequestsEvent({required this.projectId});
}

class CreateProjectEvent extends AppEvent {
  final String projectType;
  final String projectDescription;
  final List<String> requirements;
  final String? document;
  final String cooperationType;
  final String contactTime;
  final int visibility;

  CreateProjectEvent({
    required this.projectType,
    required this.projectDescription,
    required this.requirements,
    required this.document,
    required this.cooperationType,
    required this.contactTime,
    required this.visibility,
  });
}

class UpdateProjectEvent extends AppEvent {
  final int projectId;
  final String projectType;
  final String projectDescription;
  final List<String> requirements;
  final String? document;
  final String cooperationType;
  final String contactTime;
  final int visibility;

  UpdateProjectEvent({
    required this.projectId,
    required this.projectType,
    required this.projectDescription,
    required this.requirements,
    required this.document,
    required this.cooperationType,
    required this.contactTime,
    required this.visibility,
  });
}

class RateProjectEvent extends AppEvent {
  int projectId;
  int rating;
  RateProjectEvent({required this.projectId, required this.rating});
}

class ShowProjectMeetingsListEvent extends AppEvent {
  int projectId;
  ShowProjectMeetingsListEvent({required this.projectId});
}

// Contract Page
class GetContractListEvent extends AppEvent {
  int? statusFilter;
  GetContractListEvent({this.statusFilter = 0});
}

class SentEditContractRequestEvent extends AppEvent {
  String editMessage;
  String contractId;
  SentEditContractRequestEvent({
    required this.editMessage,
    required this.contractId,
  });
}

class SignContractEvent extends AppEvent {
  String signature;
  String contractId;
  SignContractEvent({required this.signature, required this.contractId});
}

// Profile Page
class GetUserProfileEvent extends AppEvent {}

class UpdateProfileEvent extends AppEvent {
  String roleId;
  String image;
  UpdateProfileEvent({required this.roleId, required this.image});
}

class LogoutEvent extends AppEvent {}
