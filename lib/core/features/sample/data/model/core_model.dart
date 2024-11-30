import 'package:getx_base/core/features/sample/domain/entity/core_entity.dart';

class CoreModel extends CoreEntity {
  const CoreModel({
    super.id,
  });

  factory CoreModel.fromJson(Map<String, dynamic> json) {
    return CoreModel(
      id: json['id'],
    );
  }
}
