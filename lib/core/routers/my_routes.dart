import 'package:getx_base/features/sample/presentation/binding/sample_binding.dart';
import 'package:getx_base/features/sample/presentation/ui/sample_page.dart';
import 'package:get/get.dart';

class Routes {
  static const Routes _i = Routes._internal();

  const Routes._internal();

  factory Routes() => _i;

  static const String samplePage = '/sample_page';
}

List<GetPage> get appPages => [
      GetPage(
        name: Routes.samplePage,
        page: () => const SamplePage(),
        binding: SampleBinding(),
      )
    ];
