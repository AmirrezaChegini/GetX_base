import 'package:getx_base/core/constants/my_api.dart';
import 'package:getx_base/core/features/sample/data/model/core_model.dart';
import 'package:getx_base/core/features/sample/domain/entity/core_entity.dart';
import 'package:getx_base/core/features/sample/domain/usecases/get_core_usecase.dart';
import 'package:getx_base/core/network/http_request.dart';
import 'package:getx_base/core/response/base_response.dart';

abstract class ICoreDatasource {
  Future<CoreEntity> getData({required CoreParams params});
}

class CoreDatasourceImpl implements ICoreDatasource {
  final IHttpRequest httpRequest;

  const CoreDatasourceImpl(this.httpRequest);

  @override
  Future<CoreEntity> getData({required CoreParams params}) async {
    dynamic response = await httpRequest.get(path: MyApi.baseUrl);

    return BaseResponse.getData<CoreEntity>(
      response,
      (json) => CoreModel.fromJson(json),
    );
  }
}
