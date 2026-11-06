import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class SignContractUsecase
    extends UseCase<Future<Either<Failure, Unit>>, SignContractParam> {
  final AppRepo appRepo;

  SignContractUsecase(this.appRepo);
  @override
  Future<Either<Failure, Unit>> call(SignContractParam param) {
    return appRepo.signContract(param);
  }
}
