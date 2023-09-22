import 'package:isar/isar.dart';
part 'camp_site.g.dart';

@collection
class CampSite {
  CampSite({
    this.name,
    this.address,
    this.phoneNumber,
    required this.updatedAt,
  })  : id = Isar.autoIncrement,
        createdAt = DateTime.now();

  Id id;

  String? name;
  String? address;
  String? phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
}
