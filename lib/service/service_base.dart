import 'dart:developer';

import 'package:isar/isar.dart';

// TODO(y.yamanobe): メモ　readの機能もモデル別じゃなく、ここで共通化できるかも
abstract class ServiceBase<T> {
  ServiceBase({
    required this.isar,
  });

  final Isar isar;

  IsarCollection<T> get collection;

  T autoIncrementId(T data);

// TODO(y.yamanobe): さらに共通化可能
// オプショナルのidが渡せるメソッドで共通処理を実装すればいい
  Future<T> create(T data) async {
    await isar.writeTxn(() async {
      // TODO(y.yamanobe memo): linterを確認
      final data0 = autoIncrementId(data);
      await collection.put(data0);
    });
    return data;
  }

  Future<T> update(T data) async {
    await isar.writeTxn(() async {
      await collection.put(data);
    });
    return data;
  }

  Future<T?> delete(int id) async {
    log('id: $id');
    await isar.writeTxn(() async {
      await collection.delete(id);
    });
    return collection.get(id);
  }
}
