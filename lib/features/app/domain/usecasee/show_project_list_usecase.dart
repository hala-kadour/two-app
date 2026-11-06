import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/data/models/single-models/project_model.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class GetProjectListUsecase
    extends UseCase<Future<Either<Failure, List<ProjectModel>>>, String> {
  final AppRepo appRepo;

  GetProjectListUsecase(this.appRepo);

  @override
  Future<Either<Failure, List<ProjectModel>>> call(String param) {
    return appRepo.showProjectList(param);
  }
}
