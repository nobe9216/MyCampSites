import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/visit.dart';
import 'package:my_camp_sites/service/service_base.dart';

class VisitService extends ServiceBase<Visit> {
  VisitService({
    required super.isar,
  });

  @override
  IsarCollection<Visit> get collection => isar.visits;

  Stream<Visit> watchVisit(Id id) async* {
    final query = isar.visits.where().idEqualTo(id);

    await for (final results in query.watch(fireImmediately: true)) {
      if (results.isNotEmpty) {
        yield results.first;
      }
    }
  }

  Stream<List<Visit>> watchAllVisits() async* {
    final query = isar.visits.where();

    await for (final results in query.watch(fireImmediately: true)) {
      if (results.isNotEmpty) {
        yield results;
      } else {
        yield [];
      }
    }
  }

  @override
  Visit autoIncrementId(Visit data) {
    return data.copyWith(
      id: Isar.autoIncrement,
      impressions: data.impressions,
    );
  }
}
