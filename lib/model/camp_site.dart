import 'package:isar/isar.dart';
part 'camp_site.g.dart';

@collection
class CampSite {
  CampSite({
    this.name,
    required this.updatedAt,
  })  : id = Isar.autoIncrement,
        createdAt = DateTime.now();

  Id id;

  String? name;
  final DateTime createdAt;
  final DateTime updatedAt;
}
