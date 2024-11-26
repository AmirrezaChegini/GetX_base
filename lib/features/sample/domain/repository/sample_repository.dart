import 'package:getx_base/core/error_handler/my_exception.dart';
import 'package:getx_base/core/utils/data_state.dart';
import 'package:getx_base/features/sample/domain/entity/sample_entity.dart';
import 'package:getx_base/features/sample/domain/usecases/get_sample_usecase.dart';

abstract class ISampleRepository {
  Future<DataState<SampleEntity, MyException>> getData({required SampleParams params});
}
