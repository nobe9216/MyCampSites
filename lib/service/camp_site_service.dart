import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/camp_site.dart';
import 'package:my_camp_sites/service/service_base.dart';

// TODO(y.yamanobe): クエリを渡して、そのクエリでサーバと通信するだけにする
class CampSiteService extends ServiceBase<CampSite> {
  CampSiteService({
    required super.isar,
  });

  @override
  IsarCollection<CampSite> get collection => isar.campSites;

  Stream<CampSite> watchCampSite(Id id) async* {
    final query = isar.campSites.where().idEqualTo(id);

    await for (final results in query.watch(fireImmediately: true)) {
      if (results.isNotEmpty) {
        yield results.first;
      }
    }
  }

  Stream<List<CampSite>> watchAllCampSites() async* {
    final query = isar.campSites.where();

    await for (final results in query.watch(fireImmediately: true)) {
      if (results.isNotEmpty) {
        yield results;
      } else {
        yield [];
      }
    }
  }
}
