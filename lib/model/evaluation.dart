import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
part 'evaluation.g.dart';
part 'evaluation.freezed.dart';

@freezed
@embedded
class Evaluation with _$Evaluation {
  const factory Evaluation({
    int? wc,
    int? kitchen,
    int? store,
    int? location,
    int? landscape,
    int? congestion,
    int? site,
  }) = _Evaluation;

  const Evaluation._();
}
