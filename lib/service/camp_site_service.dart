import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/camp_site.dart';

class CampSiteService {
  const CampSiteService(
    this.isar,
  );
  final Isar isar;

  Stream<CampSite> watchCampSite(Id id) async* {
    final query = isar.campSites.where().idEqualTo(id);

    await for (final results in query.watch(fireImmediately: true)) {
      if (results.isNotEmpty) {
        yield results.first;
      }
    }
  }

  Stream<List<CampSite>> watchAllCampSites() async* {
    final query = isar.campSites.where().sortByUpdatedAt().build();

    await for (final results in query.watch(fireImmediately: true)) {
      if (results.isNotEmpty) {
        yield results;
      } else {
        yield [];
      }
    }
  }

  Future<CampSite> addCampSite(CampSite campSite) async {
    await isar.writeTxn(() async {
      await isar.campSites.put(campSite);
    });
    return campSite;
  }

  removeCampSite(int id) async {
    await isar.writeTxn(() async {
      await isar.campSites.delete(id);
    });
  }
}
