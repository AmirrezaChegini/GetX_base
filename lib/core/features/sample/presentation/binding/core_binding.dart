import 'package:getx_base/core/features/sample/data/datasource/core_datasource.dart';
import 'package:get/get.dart';
import 'package:getx_base/core/features/sample/data/repository_impl/core_repository_impl.dart';
import 'package:getx_base/core/features/sample/domain/repository/core_repository.dart';
import 'package:getx_base/core/features/sample/domain/usecases/get_core_usecase.dart';
import 'package:getx_base/core/features/sample/presentation/controller/core_controller.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ICoreDatasource>(CoreDatasourceImpl(Get.find()));
    Get.put<ICoreRepository>(CoreRepositoryImpl(Get.find()));
    Get.put<GetCoreUseCase>(GetCoreUseCase(Get.find()));
    Get.put<CoreController>(CoreController(Get.find()));
  }

  Future<void> deleteBindings() async {
    await Future.wait([
      Get.delete<ICoreDatasource>(),
      Get.delete<ICoreRepository>(),
      Get.delete<GetCoreUseCase>(),
      Get.delete<CoreController>(),
    ]);
  }

  Future<void> refreshBinding() async {
    await deleteBindings();
    dependencies();
  }
}
