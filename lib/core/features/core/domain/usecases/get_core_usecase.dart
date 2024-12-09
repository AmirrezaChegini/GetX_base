import 'package:getx_base/core/error_handler/my_exception.dart';
import 'package:getx_base/core/features/core/domain/entity/core_entity.dart';
import 'package:getx_base/core/features/core/domain/repository/core_repository.dart';
import 'package:getx_base/core/usecase/usecase.dart';
import 'package:getx_base/core/utils/data_state.dart';

class GetCoreUseCase implements UseCase<CoreEntity, CoreParams> {
  final ICoreRepository repository;

  const GetCoreUseCase(this.repository);

  @override
  Future<DataState<CoreEntity, MyException>> call(CoreParams params) {
    return repository.getData(params: params);
  }
}

class CoreParams {
  int? id;

  CoreParams({this.id});

  CoreParams copyWith({int? id}) {
    return CoreParams(
      id: id ?? this.id,
    );
  }

  void nullID() => id = null;
}
