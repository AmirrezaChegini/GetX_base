import 'package:flutter/foundation.dart';
import 'package:getx_base/core/error_handler/my_exception.dart';
import 'package:getx_base/core/features/sample/data/datasource/core_datasource.dart';
import 'package:getx_base/core/features/sample/domain/entity/core_entity.dart';
import 'package:getx_base/core/features/sample/domain/repository/core_repository.dart';
import 'package:getx_base/core/features/sample/domain/usecases/get_core_usecase.dart';
import 'package:getx_base/core/utils/data_state.dart';

class CoreRepositoryImpl implements ICoreRepository {
  final ICoreDatasource datasource;

  const CoreRepositoryImpl(this.datasource);

  @override
  Future<DataState<CoreEntity, MyException>> getData({required CoreParams params}) async {
    try {
      CoreEntity response = await datasource.getData(params: params);
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
