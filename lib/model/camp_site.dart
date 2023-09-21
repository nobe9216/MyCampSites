import 'package:isar/isar.dart';
part 'camp_site.g.dart';

@collection
class CampSite {
  Id id = Isar.autoIncrement;

  String? name;
}
