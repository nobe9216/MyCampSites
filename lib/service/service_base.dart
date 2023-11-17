import 'package:my_camp_sites/model/camp_site.dart';

class ServiceBase {
  void createdAt(CampSite campSite) {
    campSite.createdAt ??= DateTime.now();
  }

  void updatedAt(CampSite campSite) {
    campSite.updatedAt = DateTime.now();
  }
}
