import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/visit.dart';
import 'package:my_camp_sites/providers/isar_provider.dart';
import 'package:my_camp_sites/service/visited_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'visited_service_provider.g.dart';

@Riverpod(keepAlive: true)
Future<VisitService> visitService(VisitServiceRef ref) async {
  final isar = await ref.read(isarProvider.future);
  return VisitService(isar: isar);
}

@riverpod
Stream<Visit> visitDetail(VisitDetailRef ref, Id id) async* {
  final service = await ref.read(visitServiceProvider.future);
  yield* service.watchVisit(id);
}

@riverpod
Stream<List<Visit>> visitList(VisitListRef ref) async* {
  final service = await ref.read(visitServiceProvider.future);
  yield* service.watchAllVisits();
}
