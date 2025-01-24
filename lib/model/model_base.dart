import 'package:isar/isar.dart';

mixin ModelBase {
  Id get id => Isar.autoIncrement;
  // DateTime? createdAt;
  // DateTime? updatedAt;
}
