import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class SentEditProjectRequestUsecase
    extends UseCase<Future<Either<Failure, Unit>>, EditProjectRequestParam> {
  final AppRepo appRepo;

  SentEditProjectRequestUsecase(this.appRepo);

  @override
  Future<Either<Failure, Unit>> call(EditProjectRequestParam param) {
    return appRepo.sentEditProjectRequest(param);
  }
}
