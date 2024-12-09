import 'package:equatable/equatable.dart';

class SampleEntity extends Equatable {
  final int? id;

  const SampleEntity({
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
