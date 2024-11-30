import 'package:getx_base/core/features/sample/domain/entity/core_entity.dart';
import 'package:getx_base/core/features/sample/domain/usecases/get_core_usecase.dart';
import 'package:getx_base/core/usecase/usecase.dart';
import 'package:get/get.dart';

class CoreController extends GetxController with StateMixin {
  /// ------------------Variables--------------------
  final Rx<CoreParams> coreParams = Rx(const CoreParams());
  CoreEntity coreEntity = const CoreEntity();

  /// ------------------Controllers------------------

  /// --------------------Status---------------------

  /// --------------------UseCases-------------------
  final GetCoreUseCase getCoreUseCase;

  /// ------------------Constructor------------------
  CoreController(
    this.getCoreUseCase,
  );

  @override
  void onInit() {
    super.onInit();
    change(NoParams(), status: RxStatus.success());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  /// -------------------Functions-------------------
  void changeCoreParams() {
    coreParams.value = coreParams.value.copyWith();
  }

  /// -------------------Api Calls-------------------
  Future<void> getCore() async {
    change(NoParams(), status: RxStatus.loading());
    await getCoreUseCase(coreParams.value).then(
      (value) => value.fold(
        _rightGetCore,
        (error) {
          change(NoParams(), status: RxStatus.error(error.errorMessage));
        },
      ),
    );
  }

  void _rightGetCore(CoreEntity data) {
    change(NoParams(), status: RxStatus.success());
    coreEntity = data;
  }
}
