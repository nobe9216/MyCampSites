// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVisitCollection on Isar {
  IsarCollection<Visit> get visits => this.collection();
}

const VisitSchema = CollectionSchema(
  name: r'Visit',
  id: -2497115541782241183,
  properties: {
    r'accommodationFee': PropertySchema(
      id: 0,
      name: r'accommodationFee',
      type: IsarType.long,
    ),
    r'campSiteId': PropertySchema(
      id: 1,
      name: r'campSiteId',
      type: IsarType.long,
    ),
    r'evaluations': PropertySchema(
      id: 2,
      name: r'evaluations',
      type: IsarType.object,
      target: r'Evaluation',
    ),
    r'foodCosts': PropertySchema(
      id: 3,
      name: r'foodCosts',
      type: IsarType.long,
    ),
    r'impressions': PropertySchema(
      id: 4,
      name: r'impressions',
      type: IsarType.string,
    ),
    r'incidentalExpenses': PropertySchema(
      id: 5,
      name: r'incidentalExpenses',
      type: IsarType.long,
    ),
    r'lengthOfStay': PropertySchema(
      id: 6,
      name: r'lengthOfStay',
      type: IsarType.long,
    ),
    r'transportationFee': PropertySchema(
      id: 7,
      name: r'transportationFee',
      type: IsarType.long,
    ),
    r'visitedDate': PropertySchema(
      id: 8,
      name: r'visitedDate',
      type: IsarType.dateTime,
    ),
    r'weather': PropertySchema(
      id: 9,
      name: r'weather',
      type: IsarType.string,
    )
  },
  estimateSize: _visitEstimateSize,
  serialize: _visitSerialize,
  deserialize: _visitDeserialize,
  deserializeProp: _visitDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Evaluation': EvaluationSchema},
  getId: _visitGetId,
  getLinks: _visitGetLinks,
  attach: _visitAttach,
  version: '3.1.0+1',
);

int _visitEstimateSize(
  Visit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      EvaluationSchema.estimateSize(
          object.evaluations, allOffsets[Evaluation]!, allOffsets);
  bytesCount += 3 + object.impressions.length * 3;
  bytesCount += 3 + object.weather.length * 3;
  return bytesCount;
}

void _visitSerialize(
  Visit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accommodationFee);
  writer.writeLong(offsets[1], object.campSiteId);
  writer.writeObject<Evaluation>(
    offsets[2],
    allOffsets,
    EvaluationSchema.serialize,
    object.evaluations,
  );
  writer.writeLong(offsets[3], object.foodCosts);
  writer.writeString(offsets[4], object.impressions);
  writer.writeLong(offsets[5], object.incidentalExpenses);
  writer.writeLong(offsets[6], object.lengthOfStay);
  writer.writeLong(offsets[7], object.transportationFee);
  writer.writeDateTime(offsets[8], object.visitedDate);
  writer.writeString(offsets[9], object.weather);
}

Visit _visitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Visit(
    accommodationFee: reader.readLong(offsets[0]),
    campSiteId: reader.readLong(offsets[1]),
    evaluations: reader.readObjectOrNull<Evaluation>(
          offsets[2],
          EvaluationSchema.deserialize,
          allOffsets,
        ) ??
        Evaluation(),
    foodCosts: reader.readLong(offsets[3]),
    id: id,
    impressions: reader.readString(offsets[4]),
    incidentalExpenses: reader.readLong(offsets[5]),
    lengthOfStay: reader.readLong(offsets[6]),
    transportationFee: reader.readLong(offsets[7]),
    visitedDate: reader.readDateTimeOrNull(offsets[8]),
    weather: reader.readString(offsets[9]),
  );
  return object;
}

P _visitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<Evaluation>(
            offset,
            EvaluationSchema.deserialize,
            allOffsets,
          ) ??
          Evaluation()) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _visitGetId(Visit object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _visitGetLinks(Visit object) {
  return [];
}

void _visitAttach(IsarCollection<dynamic> col, Id id, Visit object) {
  object.id = id;
}

extension VisitQueryWhereSort on QueryBuilder<Visit, Visit, QWhere> {
  QueryBuilder<Visit, Visit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VisitQueryWhere on QueryBuilder<Visit, Visit, QWhereClause> {
  QueryBuilder<Visit, Visit, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Visit, Visit, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Visit, Visit, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Visit, Visit, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VisitQueryFilter on QueryBuilder<Visit, Visit, QFilterCondition> {
  QueryBuilder<Visit, Visit, QAfterFilterCondition> accommodationFeeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accommodationFee',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> accommodationFeeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accommodationFee',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> accommodationFeeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accommodationFee',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> accommodationFeeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accommodationFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> campSiteIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'campSiteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> campSiteIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'campSiteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> campSiteIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'campSiteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> campSiteIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'campSiteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> foodCostsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodCosts',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> foodCostsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodCosts',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> foodCostsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodCosts',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> foodCostsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodCosts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> impressionsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impressions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> impressionsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'impressions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> impressionsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'impressions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> impressionsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'impressions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> impressionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'impressions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> impressionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'impressions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> impressionsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'impressions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> impressionsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'impressions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> impressionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impressions',
        value: '',
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> impressionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'impressions',
        value: '',
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> incidentalExpensesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incidentalExpenses',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition>
      incidentalExpensesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'incidentalExpenses',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> incidentalExpensesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'incidentalExpenses',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> incidentalExpensesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'incidentalExpenses',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> lengthOfStayEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lengthOfStay',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> lengthOfStayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lengthOfStay',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> lengthOfStayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lengthOfStay',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> lengthOfStayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lengthOfStay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> transportationFeeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transportationFee',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition>
      transportationFeeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transportationFee',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> transportationFeeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transportationFee',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> transportationFeeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transportationFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> visitedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visitedDate',
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> visitedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visitedDate',
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> visitedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visitedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> visitedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visitedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> visitedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visitedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> visitedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visitedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> weatherEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> weatherGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> weatherLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> weatherBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weather',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> weatherStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> weatherEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> weatherContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> weatherMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weather',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> weatherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weather',
        value: '',
      ));
    });
  }

  QueryBuilder<Visit, Visit, QAfterFilterCondition> weatherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weather',
        value: '',
      ));
    });
  }
}

extension VisitQueryObject on QueryBuilder<Visit, Visit, QFilterCondition> {
  QueryBuilder<Visit, Visit, QAfterFilterCondition> evaluations(
      FilterQuery<Evaluation> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'evaluations');
    });
  }
}

extension VisitQueryLinks on QueryBuilder<Visit, Visit, QFilterCondition> {}

extension VisitQuerySortBy on QueryBuilder<Visit, Visit, QSortBy> {
  QueryBuilder<Visit, Visit, QAfterSortBy> sortByAccommodationFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accommodationFee', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByAccommodationFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accommodationFee', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByCampSiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campSiteId', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByCampSiteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campSiteId', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByFoodCosts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodCosts', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByFoodCostsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodCosts', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByImpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impressions', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByImpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impressions', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByIncidentalExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incidentalExpenses', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByIncidentalExpensesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incidentalExpenses', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByLengthOfStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthOfStay', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByLengthOfStayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthOfStay', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByTransportationFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportationFee', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByTransportationFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportationFee', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByVisitedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitedDate', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByVisitedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitedDate', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weather', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> sortByWeatherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weather', Sort.desc);
    });
  }
}

extension VisitQuerySortThenBy on QueryBuilder<Visit, Visit, QSortThenBy> {
  QueryBuilder<Visit, Visit, QAfterSortBy> thenByAccommodationFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accommodationFee', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByAccommodationFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accommodationFee', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByCampSiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campSiteId', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByCampSiteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campSiteId', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByFoodCosts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodCosts', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByFoodCostsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodCosts', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByImpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impressions', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByImpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impressions', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByIncidentalExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incidentalExpenses', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByIncidentalExpensesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incidentalExpenses', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByLengthOfStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthOfStay', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByLengthOfStayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lengthOfStay', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByTransportationFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportationFee', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByTransportationFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportationFee', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByVisitedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitedDate', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByVisitedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitedDate', Sort.desc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByWeather() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weather', Sort.asc);
    });
  }

  QueryBuilder<Visit, Visit, QAfterSortBy> thenByWeatherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weather', Sort.desc);
    });
  }
}

extension VisitQueryWhereDistinct on QueryBuilder<Visit, Visit, QDistinct> {
  QueryBuilder<Visit, Visit, QDistinct> distinctByAccommodationFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accommodationFee');
    });
  }

  QueryBuilder<Visit, Visit, QDistinct> distinctByCampSiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'campSiteId');
    });
  }

  QueryBuilder<Visit, Visit, QDistinct> distinctByFoodCosts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodCosts');
    });
  }

  QueryBuilder<Visit, Visit, QDistinct> distinctByImpressions(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impressions', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Visit, Visit, QDistinct> distinctByIncidentalExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'incidentalExpenses');
    });
  }

  QueryBuilder<Visit, Visit, QDistinct> distinctByLengthOfStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lengthOfStay');
    });
  }

  QueryBuilder<Visit, Visit, QDistinct> distinctByTransportationFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transportationFee');
    });
  }

  QueryBuilder<Visit, Visit, QDistinct> distinctByVisitedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitedDate');
    });
  }

  QueryBuilder<Visit, Visit, QDistinct> distinctByWeather(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weather', caseSensitive: caseSensitive);
    });
  }
}

extension VisitQueryProperty on QueryBuilder<Visit, Visit, QQueryProperty> {
  QueryBuilder<Visit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Visit, int, QQueryOperations> accommodationFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accommodationFee');
    });
  }

  QueryBuilder<Visit, int, QQueryOperations> campSiteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'campSiteId');
    });
  }

  QueryBuilder<Visit, Evaluation, QQueryOperations> evaluationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evaluations');
    });
  }

  QueryBuilder<Visit, int, QQueryOperations> foodCostsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodCosts');
    });
  }

  QueryBuilder<Visit, String, QQueryOperations> impressionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impressions');
    });
  }

  QueryBuilder<Visit, int, QQueryOperations> incidentalExpensesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'incidentalExpenses');
    });
  }

  QueryBuilder<Visit, int, QQueryOperations> lengthOfStayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lengthOfStay');
    });
  }

  QueryBuilder<Visit, int, QQueryOperations> transportationFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transportationFee');
    });
  }

  QueryBuilder<Visit, DateTime?, QQueryOperations> visitedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitedDate');
    });
  }

  QueryBuilder<Visit, String, QQueryOperations> weatherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weather');
    });
  }
}
