import 'package:two_client_app/config/constants/baseuri.dart';
import 'package:two_client_app/core/api/get_api.dart';
import 'package:two_client_app/core/api/get_with_token_api.dart';
import 'package:two_client_app/core/api/post_api.dart';
import 'package:two_client_app/core/api/post_api_with_token.dart';
import 'package:two_client_app/core/models/empty_response_model.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/param/casule_param.dart';
import 'package:two_client_app/features/app/data/models/response-models/create_project_response_model.dart';
import 'package:two_client_app/features/app/data/models/response-models/get_user_profile_response_model.dart';
import 'package:two_client_app/features/app/data/models/response-models/login_response_model.dart';
import 'package:two_client_app/features/app/data/models/response-models/show_contract_list_response_model.dart';
import 'package:two_client_app/features/app/data/models/response-models/show_notification_response_model.dart';
import 'package:two_client_app/features/app/data/models/response-models/show_project_edit_request_list_response_model.dart';
import 'package:two_client_app/features/app/data/models/response-models/show_project_list_response_model.dart';
import 'package:two_client_app/features/app/data/models/response-models/show_project_meeting_list_reponse_model.dart';
import 'package:two_client_app/features/app/data/models/response-models/show_unread_notification_response_model.dart';

abstract class AppRemoteDatasource {
  /// login user
  Future<LoginResponseModel> login(LoginParam param);

  /// logout
  Future<EmptyResponseModel> logout(String token);

  /// get user profile
  Future<GetUserProfileResponseModel> getUserProfile(String token);

  /// show client projects
  Future<ShowProjectListResponseModel> showProjectList(String token);

  /// sent edit request for the project
  Future<EmptyResponseModel> sentEditProjectRequest(
    EditProjectRequestParam param,
  );

  /// update project
  Future<EmptyResponseModel> updateProject(UpdateProjectParam param);

  /// create project
  Future<CreateProjectResponseModel> createProject(CreateProjectParam param);

  /// Show Project Edit Request
  Future<ShowProjectEditRequestListResponseModel> showProjectEditRequest(
    ShowProjectEditRequestParam param,
  );

  /// rate project
  Future<EmptyResponseModel> rateProject(RateProjectParam param);

  /// show project meeting list
  Future<ShowProjectMeetingListResponseModel> showProjectMeetingList(
    int projectId,
  );

  /// client sign contract
  Future<EmptyResponseModel> signContract(SignContractParam param);

  /// show client contracts
  Future<ShowContractListResponseModel> showContractList(
    ShowContractListParam param,
  );

  /// sent edit request for the contract
  Future<EmptyResponseModel> sentEditContractRequest(
    EditContractRequestParam param,
  );

  /// show notification
  Future<ShowNotificationResponseModel> showNotification(
    TokenWithIdParam param,
  );

  /// show unread notification
  Future<ShowUnreadNotificationResponseModel> showUnReadNotification(
    String token,
  );
}

class AppRemoteDatasourceImpl extends AppRemoteDatasource {
  @override
  Future<LoginResponseModel> login(LoginParam param) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/login"),
      body: ({'email': param.email, 'password': param.password}),
      fromJson: loginResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> logout(String token) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/logout"),
      token: token,
      body: ({}),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> sentEditContractRequest(
    EditContractRequestParam param,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/client/request/edit_contract"),
      token: param.token,
      body: ({
        'client_edit_request': param.editMessage,
        'contract_id': param.contractId,
      }),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> sentEditProjectRequest(
    EditProjectRequestParam param,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/client/request/project/edit"),
      token: param.token,
      body: ({
        'project_id': param.projectId.toString(),
        'message': param.editMessage,
      }),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<ShowContractListResponseModel> showContractList(
    ShowContractListParam param,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse(
        "$baseUri/api/show/client/contracts?filter[status]=${param.statusFilter}",
      ),
      token: param.token,
      fromJson: showContractListResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowNotificationResponseModel> showNotification(
    TokenWithIdParam param,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/notification/${param.id}"),
      token: param.token,
      fromJson: showNotificationResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowProjectListResponseModel> showProjectList(String token) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/my/projects"),
      token: token,
      fromJson: showProjectListResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowUnreadNotificationResponseModel> showUnReadNotification(
    String token,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/unread/notifications"),
      token: token,
      fromJson: showUnreadNotificationResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> signContract(SignContractParam param) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/add/sign"),
      token: param.token,
      body: ({
        'signature': 'data:image/png;base64,${param.signature}',
        'contract_id': param.contractId,
      }),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<GetUserProfileResponseModel> getUserProfile(String token) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/user/profile"),
      token: token,
      fromJson: getUserProfileResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> updateProject(UpdateProjectParam param) async {
    if (param.document == null) {
      final result = PostWithTokenApi(
        uri: Uri.parse("$baseUri/api/update/project"),
        token: param.token,
        body: ({
          "project_type": param.projectType,
          "project_description": param.projectDescription,
          "requirements": param.requirements,
          "cooperation_type": param.cooperationType,
          "contact_time": param.contactTime,
          "private": param.visibility,
          "project_id": param.projectId,
        }),
        fromJson: emptyResponseModelFromJson,
      );
      return await result.call();
    } else {
      final result = PostWithTokenApi(
        uri: Uri.parse("$baseUri/api/update/project"),
        token: param.token,
        body: ({
          "project_type": param.projectType,
          "project_description": param.projectDescription,
          "requirements": param.requirements,
          "document": "$pdfBase64${param.document}",
          "cooperation_type": param.cooperationType,
          "contact_time": param.contactTime,
          "private": param.visibility,
          "project_id": param.projectId,
        }),
        fromJson: emptyResponseModelFromJson,
      );
      return await result.call();
    }
  }

  @override
  Future<ShowProjectEditRequestListResponseModel> showProjectEditRequest(
    ShowProjectEditRequestParam param,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse(
        "$baseUri/api/show/latest/edit/request/${param.projectId}",
      ),
      token: param.token,
      fromJson: showProjectEditRequestListResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<CreateProjectResponseModel> createProject(
    CreateProjectParam param,
  ) async {
    if (param.document != null) {
      Map<String, dynamic> body = {
        "project_type": param.type,
        "project_description": param.description,
        "requirements": param.requirements,
        "document": "$pdfBase64${param.document!}",
        "cooperation_type": param.cooperationType,
        "contact_time": param.contactTime,
        "private": "1",
      };
      final result = PostWithTokenApi(
        uri: Uri.parse("$baseUri/api/create/project"),
        body: body,
        fromJson: createProjectResponseModelFromJson,
        token: param.token,
      );
      return await result.call();
    } else {
      Map<String, dynamic> body = {
        "project_type": param.type,
        "project_description": param.description,
        "requirements": param.requirements,
        "cooperation_type": param.cooperationType,
        "contact_time": param.contactTime,
        "private": "1",
      };
      final result = PostWithTokenApi(
        uri: Uri.parse("$baseUri/api/create/project"),
        body: body,
        fromJson: createProjectResponseModelFromJson,
        token: param.token,
      );
      return await result.call();
    }
  }

  @override
  Future<EmptyResponseModel> rateProject(RateProjectParam param) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/review/project"),
      token: param.token,
      body: ({"project_id": param.projectId, "review": param.rating}),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<ShowProjectMeetingListResponseModel> showProjectMeetingList(
    int projectId,
  ) async {
    final reslut = GetApi(
      uri: Uri.parse("$baseUri/api/show/project/meetings/$projectId"),
      fromJson: showProjectMeetingListResponseModelFromJson,
    );
    return await reslut.callRequest();
  }
}
