// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EvaluationSchema = Schema(
  name: r'Evaluation',
  id: 6409158845927912730,
  properties: {},
  estimateSize: _evaluationEstimateSize,
  serialize: _evaluationSerialize,
  deserialize: _evaluationDeserialize,
  deserializeProp: _evaluationDeserializeProp,
);

int _evaluationEstimateSize(
  Evaluation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _evaluationSerialize(
  Evaluation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
Evaluation _evaluationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Evaluation();
  return object;
}

P _evaluationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EvaluationQueryFilter
    on QueryBuilder<Evaluation, Evaluation, QFilterCondition> {}

extension EvaluationQueryObject
    on QueryBuilder<Evaluation, Evaluation, QFilterCondition> {}
