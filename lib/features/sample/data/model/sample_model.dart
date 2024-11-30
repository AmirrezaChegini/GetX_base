import 'package:getx_base/features/sample/domain/entity/sample_entity.dart';

class SampleModel extends SampleEntity {
  const SampleModel({
    super.id,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) {
    return SampleModel(
      id: json['id'],
    );
  }
}
