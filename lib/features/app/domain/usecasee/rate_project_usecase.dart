import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class RateProjectUsecase
    extends UseCase<Future<Either<Failure, Unit>>, RateProjectParam> {
  final AppRepo appRepo;

  RateProjectUsecase(this.appRepo);

  @override
  Future<Either<Failure, Unit>> call(RateProjectParam param) {
    return appRepo.rateProject(param);
  }
}
