import 'package:dartz/dartz.dart';
import 'package:two_client_app/core/error/failures.dart';
import 'package:two_client_app/core/param/app_param.dart';
import 'package:two_client_app/core/usecases/usecase.dart';
import 'package:two_client_app/features/app/data/models/single-models/contract_model.dart';
import 'package:two_client_app/features/app/domain/repos/app_repo.dart';

class GetContractListUsecase
    extends
        UseCase<
          Future<Either<Failure, List<ContractModel>>>,
          ShowContractListParam
        > {
  final AppRepo appRepo;

  GetContractListUsecase(this.appRepo);

  @override
  Future<Either<Failure, List<ContractModel>>> call(
    ShowContractListParam param,
  ) {
    return appRepo.showContractList(param);
  }
}
