import 'package:getx_base/core/error_handler/my_exception.dart';
import 'package:getx_base/core/usecase/usecase.dart';
import 'package:getx_base/core/utils/data_state.dart';
import 'package:getx_base/features/sample/domain/entity/sample_entity.dart';
import 'package:getx_base/features/sample/domain/repository/sample_repository.dart';

class GetSampleUseCase implements UseCase<SampleEntity, SampleParams> {
  final ISampleRepository repository;

  const GetSampleUseCase(this.repository);

  @override
  Future<DataState<SampleEntity, MyException>> call(SampleParams params) {
    return repository.getData(params: params);
  }
}

class SampleParams {
  const SampleParams();

  SampleParams copyWith() {
    return const SampleParams();
  }
}
