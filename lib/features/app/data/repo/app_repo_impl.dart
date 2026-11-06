import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/param/casule_param.dart';
import 'package:two_client_app/features/app/data/datasource/app_remote_datasource.dart';
import 'package:two_client_app/features/app/data/models/response-models/login_response_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/contract_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/meeting_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/message_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/notification_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/profile_model.dart';
import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class AppRepoImpl extends AppRepo {
  final AppRemoteDatasource appRemoteDatasource;

  AppRepoImpl(this.appRemoteDatasource);
  @override
  Future<Either<Failure, UserModel>> login(LoginParam param) {
    return wrapHandling(
      tryCall: () async {
        final result = await appRemoteDatasource.login(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> logout(String token) {
    return wrapHandling(
      tryCall: () async {
        await appRemoteDatasource.logout(token);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> sentEditContractRequest(
    EditContractRequestParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        await appRemoteDatasource.sentEditContractRequest(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> sentEditProjectRequest(
    EditProjectRequestParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        await appRemoteDatasource.sentEditProjectRequest(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<ContractModel>>> showContractList(
    ShowContractListParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await appRemoteDatasource.showContractList(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, NotificationModel>> showNotification(
    TokenWithIdParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await appRemoteDatasource.showNotification(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<ProjectModel>>> showProjectList(String token) {
    return wrapHandling(
      tryCall: () async {
        final result = await appRemoteDatasource.showProjectList(token);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<NotificationModel>>> showUnReadNotification(
    String token,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await appRemoteDatasource.showUnReadNotification(token);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> signContract(SignContractParam param) {
    return wrapHandling(
      tryCall: () async {
        await appRemoteDatasource.signContract(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, ProfileModel>> getUserProfile(String token) {
    return wrapHandling(
      tryCall: () async {
        final result = await appRemoteDatasource.getUserProfile(token);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateProject(UpdateProjectParam param) {
    return wrapHandling(
      tryCall: () async {
        await appRemoteDatasource.updateProject(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<MessageModel>>> showProjectEditRequest(
    ShowProjectEditRequestParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await appRemoteDatasource.showProjectEditRequest(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> createProject(CreateProjectParam param) {
    return wrapHandling(
      tryCall: () async {
        await appRemoteDatasource.createProject(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> rateProject(RateProjectParam param) {
    return wrapHandling(
      tryCall: () async {
        await appRemoteDatasource.rateProject(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<MeetingModel>>> showProjectMeetingList(
    int projectId,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await appRemoteDatasource.showProjectMeetingList(
          projectId,
        );
        return Right(result.data);
      },
    );
  }
}
