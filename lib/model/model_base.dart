import 'package:isar/isar.dart';

mixin ModelBase {
  // TODO(y.yamanobe memo): 登録する時にだけ、copyWithメソッドでidを詰める　そうじゃない時は受け取ったidを詰める
  Id? id;
  // DateTime? createdAt;
  // DateTime? updatedAt;
}
