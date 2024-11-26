import 'package:getx_base/features/sample/data/datasource/sample_datasource.dart';
import 'package:getx_base/features/sample/data/repository_impl/sample_repository_impl.dart';
import 'package:getx_base/features/sample/domain/repository/sample_repository.dart';
import 'package:getx_base/features/sample/domain/usecases/get_sample_usecase.dart';
import 'package:getx_base/features/sample/presentation/controller/sample_controller.dart';
import 'package:get/get.dart';

class SampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ISampleDatasource>(SampleDatasourceImpl(Get.find()));
    Get.put<ISampleRepository>(SampleRepositoryImpl(Get.find()));
    Get.put<GetSampleUseCase>(GetSampleUseCase(Get.find()));
    Get.put<SampleController>(SampleController(Get.find()));
  }

  Future<void> deleteBindings() async {
    await Future.wait([
      Get.delete<ISampleDatasource>(),
      Get.delete<ISampleRepository>(),
      Get.delete<GetSampleUseCase>(),
      Get.delete<SampleController>(),
    ]);
  }

  Future<void> refreshBinding() async {
    await deleteBindings();
    dependencies();
  }
}
