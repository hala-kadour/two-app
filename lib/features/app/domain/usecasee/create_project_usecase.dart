import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class CreateProjectUsecase
    extends UseCase<Future<Either<Failure, Unit>>, CreateProjectParam> {
  final AppRepo appRepo;

  CreateProjectUsecase(this.appRepo);

  @override
  Future<Either<Failure, Unit>> call(CreateProjectParam param) {
    return appRepo.createProject(param);
  }
}
