import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/model_base.dart';

// TODO(y.yamanobe): メモ　readの機能もモデル別じゃなく、ここで共通化できるかも
abstract class ServiceBase<T extends ModelBase> {
  ServiceBase({
    required this.isar,
  });

  final Isar isar;

  IsarCollection<T> get collection;

  Future<T> createOrUpdate(T data) async {
    log('data.id: ${data.id}');
    await isar.writeTxn(() async {
      // TODO(y.yamanobe memo): 別の方法で登録
      // final date = DateTime.now();
      // data.createdAt = date;
      // data.updatedAt = date;
      await collection.put(data);
    });
    return data;
  }

  Future<T?> delete(int id) async {
    log('id: $id');
    await isar.writeTxn(() async {
      await collection.delete(14);
    });
    return collection.get(id);
  }
}
