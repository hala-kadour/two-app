class LoginParam {
  LoginParam({required this.email, required this.password});
  String email;
  String password;
}

class ShowContractListParam {
  ShowContractListParam({required this.token, required this.statusFilter});
  String token;
  int statusFilter;
}

class EditContractRequestParam {
  EditContractRequestParam({
    required this.token,
    required this.editMessage,
    required this.contractId,
  });
  String token;
  String editMessage;
  String contractId;
}

class SignContractParam {
  SignContractParam({
    required this.token,
    required this.signature,
    required this.contractId,
  });
  String token;
  String signature;
  String contractId;
}

class EditProjectRequestParam {
  EditProjectRequestParam({
    required this.token,
    required this.projectId,
    required this.editMessage,
  });
  String token;
  int projectId;
  String editMessage;
}

class CreateProjectParam {
  final String token;
  final String type;
  final String description;
  final List<String> requirements;
  final String? document;
  final String cooperationType;
  final String contactTime;

  CreateProjectParam({
    required this.token,
    required this.type,
    required this.description,
    required this.requirements,
    required this.document,
    required this.cooperationType,
    required this.contactTime,
  });
}

class UpdateProfileParam {
  UpdateProfileParam({
    required this.token,
    required this.roleId,
    required this.image,
  });
  String token;
  String roleId;
  String image;
}

class UpdateProjectParam {
  final String token;
  final int projectId;
  final String projectType;
  final String projectDescription;
  final List<String> requirements;
  final String? document;
  final String cooperationType;
  final String contactTime;
  final int visibility;
  UpdateProjectParam({
    required this.token,
    required this.projectId,
    required this.projectType,
    required this.projectDescription,
    required this.requirements,
    this.document,
    required this.cooperationType,
    required this.contactTime,
    required this.visibility,
  });
}

class ShowProjectEditRequestParam {
  final int projectId;
  final String token;

  ShowProjectEditRequestParam({required this.projectId, required this.token});
}

class RateProjectParam {
  final String token;
  final String projectId;
  final String rating;

  RateProjectParam({
    required this.token,
    required this.projectId,
    required this.rating,
  });
}
