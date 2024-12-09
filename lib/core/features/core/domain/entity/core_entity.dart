import 'package:equatable/equatable.dart';

class CoreEntity extends Equatable {
  final int? id;

  const CoreEntity({
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
