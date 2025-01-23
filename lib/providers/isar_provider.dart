import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/camp_site.dart';
import 'package:my_camp_sites/model/visit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(IsarRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open([CampSiteSchema, VisitSchema], directory: dir.path);
}
