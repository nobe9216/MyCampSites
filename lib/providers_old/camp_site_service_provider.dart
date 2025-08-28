import 'package:isar/isar.dart';
import 'package:my_camp_sites/model_old/camp_site.dart';
import 'package:my_camp_sites/providers_old/isar_provider.dart';
import 'package:my_camp_sites/service_old/camp_site_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camp_site_service_provider.g.dart';

@Riverpod(keepAlive: true)
Future<CampSiteService> campSiteService(CampSiteServiceRef ref) async {
  final isar = await ref.read(isarProvider.future);
  return CampSiteService(isar: isar);
}

@riverpod
Stream<CampSite> campSiteDetail(CampSiteDetailRef ref, Id id) async* {
  final service = await ref.read(campSiteServiceProvider.future);
  yield* service.watchCampSite(id);
}

@riverpod
Stream<List<CampSite>> campSiteList(CampSiteListRef ref) async* {
  final service = await ref.read(campSiteServiceProvider.future);
  yield* service.watchAllCampSites();
}
