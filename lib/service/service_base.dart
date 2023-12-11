import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/model_base.dart';

abstract class ServiceBase<T extends ModelBase> {
  ServiceBase({
    required this.isar,
  });

  final Isar isar;

  IsarCollection<T> get collection;

  Future<T> create(T data) async {
    await isar.writeTxn(() async {
      final date = DateTime.now();
      data.createdAt = date;
      data.updatedAt = date;
      await collection.put(data);
    });
    return data;
  }
}
