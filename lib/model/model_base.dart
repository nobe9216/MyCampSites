import 'package:isar/isar.dart';

abstract class ModelBase {
  Id id = Isar.autoIncrement;
  DateTime? createdAt;
  DateTime? updatedAt;
}
