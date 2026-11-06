import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/error/handling_exception_manager.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/param/casule_param.dart';
import 'package:two_client_app/features/app/data/models/response-models/login_response_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/contract_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/meeting_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/message_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/notification_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/profile_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';

abstract class AppRepo with HandlingExceptionManager {
  /// login user
  Future<Either<Failure, UserModel>> login(LoginParam param);

  ///logout user
  Future<Either<Failure, Unit>> logout(String token);

  /// get user profile
  Future<Either<Failure, ProfileModel>> getUserProfile(String token);

  /// show client projects
  Future<Either<Failure, List<ProjectModel>>> showProjectList(String token);

  Future<Either<Failure, Unit>> createProject(CreateProjectParam param);

  Future<Either<Failure, Unit>> updateProject(UpdateProjectParam param);

  Future<Either<Failure, List<MessageModel>>> showProjectEditRequest(
    ShowProjectEditRequestParam param,
  );

  /// sent edit request for the project
  Future<Either<Failure, Unit>> sentEditProjectRequest(
    EditProjectRequestParam param,
  );

  /// rate project
  Future<Either<Failure, Unit>> rateProject(RateProjectParam param);

  /// show project meeting list
  Future<Either<Failure, List<MeetingModel>>> showProjectMeetingList(
    int projectId,
  );

  /// client sign contract
  Future<Either<Failure, Unit>> signContract(SignContractParam param);

  /// show client contracts
  Future<Either<Failure, List<ContractModel>>> showContractList(
    ShowContractListParam param,
  );

  /// sent edit request for the contract
  Future<Either<Failure, Unit>> sentEditContractRequest(
    EditContractRequestParam param,
  );

  /// show notification
  Future<Either<Failure, NotificationModel>> showNotification(
    TokenWithIdParam param,
  );

  /// show unread notification
  Future<Either<Failure, List<NotificationModel>>> showUnReadNotification(
    String token,
  );
}
