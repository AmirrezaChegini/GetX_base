import 'package:getx_base/core/constants/my_api.dart';
import 'package:getx_base/core/network/http_request.dart';
import 'package:getx_base/core/response/base_response.dart';
import 'package:getx_base/features/sample/data/model/sample_model.dart';
import 'package:getx_base/features/sample/domain/entity/sample_entity.dart';
import 'package:getx_base/features/sample/domain/usecases/get_sample_usecase.dart';

abstract class ISampleDatasource {
  Future<SampleEntity> getData({required SampleParams params});
}

class SampleDatasourceImpl implements ISampleDatasource {
  final IHttpRequest httpRequest;

  const SampleDatasourceImpl(this.httpRequest);

  @override
  Future<SampleEntity> getData({required SampleParams params}) async {
    final response = await httpRequest.get(
      path: MyApi.baseUrl,
    );

    return BaseResponse.getData<SampleEntity>(
      response,
      (json) => SampleModel.fromJson(json),
    );
  }
}
