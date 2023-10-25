import 'package:isar/isar.dart';
part 'camp_site.g.dart';

@collection
class CampSite {
  CampSite({
    this.name,
    this.address,
    this.phoneNumber,
    this.memo,
    required this.updatedAt,
  })  : id = Isar.autoIncrement,
        createdAt = DateTime.now();

  Id id;

  String? name;
  String? address;
  String? phoneNumber;
  String? memo;
  final DateTime createdAt;
  final DateTime updatedAt;

  CampSite copyWith({
    String? name,
    String? address,
    String? phoneNumber,
    String? memo,
    DateTime? updatedAt,
  }) =>
      CampSite(
        name: name ?? this.name,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        memo: memo ?? this.memo,
        updatedAt: updatedAt ?? DateTime.now(),
      );
}
