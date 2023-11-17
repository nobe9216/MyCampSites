import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/model_base.dart';
part 'camp_site.g.dart';

@collection
class CampSite extends ModelBase {
  String? name;
  String? address;
  String? phoneNumber;
  String? memo;
}
