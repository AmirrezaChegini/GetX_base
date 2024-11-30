import 'package:flutter/foundation.dart';
import 'package:getx_base/core/error_handler/my_exception.dart';
import 'package:getx_base/core/utils/data_state.dart';
import 'package:getx_base/features/sample/data/datasource/sample_datasource.dart';
import 'package:getx_base/features/sample/domain/entity/sample_entity.dart';
import 'package:getx_base/features/sample/domain/repository/sample_repository.dart';
import 'package:getx_base/features/sample/domain/usecases/get_sample_usecase.dart';

class SampleRepositoryImpl implements ISampleRepository {
  final ISampleDatasource datasource;

  const SampleRepositoryImpl(this.datasource);

  @override
  Future<DataState<SampleEntity, MyException>> getData({required SampleParams params}) async {
    try {
      final SampleEntity response = await datasource.getData(params: params);
      return DataState.success(response);
    } on MyException catch (e) {
      return DataState.error(e);
    } catch (e) {
      if (kDebugMode) {
        rethrow;
      } else {
        return DataState.error(MyException(errorMessage: '$e'));
      }
    }
  }
}
