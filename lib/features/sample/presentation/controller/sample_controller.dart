import 'package:getx_base/core/usecase/usecase.dart';
import 'package:getx_base/features/sample/domain/entity/sample_entity.dart';
import 'package:getx_base/features/sample/domain/usecases/get_sample_usecase.dart';
import 'package:get/get.dart';

class SampleController extends GetxController with StateMixin {
  /// ------------------Variables--------------------
  final Rx<SampleParams> sampleParams = Rx(const SampleParams());
  SampleEntity sampleEntity = const SampleEntity();

  /// ------------------Controllers------------------

  /// --------------------Status---------------------

  /// --------------------UseCases-------------------
  final GetSampleUseCase getSampleUseCase;

  /// ------------------Constructor------------------
  SampleController(
    this.getSampleUseCase,
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
  void changeSampleParams() {
    sampleParams.value = sampleParams.value.copyWith();
  }

  /// -------------------Api Calls-------------------
  Future<void> getSample() async {
    change(NoParams(), status: RxStatus.loading());
    await getSampleUseCase(sampleParams.value).then(
      (value) => value.fold(
        _rightGetSample,
        (error) {
          change(NoParams(), status: RxStatus.error(error.errorMessage));
        },
      ),
    );
  }

  void _rightGetSample(SampleEntity data) {
    change(NoParams(), status: RxStatus.success());
    sampleEntity = data;
  }
}
