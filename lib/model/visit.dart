import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/evaluation.dart';
import 'package:my_camp_sites/model/visit_base.dart';
part 'visit.g.dart';
part 'visit.freezed.dart';

// TODO(y.yamanobe memo): TODO整理

// TODO(y.yamanobe): isarならではの初期化の仕方を調べて反映（ドキュメントであるはず）
// インスタンス化の時

// TODO(y.yamanobe): 登録時に必要な、初期値を入れるファクトリコンストラクタを作れば、オプショナルにする必要ない
// コンストラクタで、必須の値だけ詰める形でもいい　isarが許すなら、名前付きコンストラクタで詰めてもいい

// TODO(y.yamanobe memo): 名前付きコンストラクタで、最初から値を詰めてインスタンス化してくれるコンストラクタを作れば、編集時などのインスタンス化に便利
// 名前付きコンストラクタは必要な時に
@freezed
@collection
class Visit with VisitBase, _$Visit {
  factory Visit({
    Id? id,
    DateTime? visitedDate,
    @Default(-1) int campSiteId,
    @Default(0) int accommodationFee,
    @Default(0) int transportationFee,
    @Default(0) int foodCosts,
    @Default(0) int incidentalExpenses,
    @Default('') String weather,
    @Default(0) int lengthOfStay,
    @Default('') String impressions,
    @Default(Evaluation()) Evaluation evaluations,
  }) = _Visit;

  Visit._();
  // TODO(y.yamanobe memo): 雑な初期値を入れないで済む方法
  // 動線を変える　キャンプ場の画面から訪問実績を入力させる動線にすれば、初期値は選択済みのキャンプ場になる
  // 段階を踏んで入力させる　最初にキャンプ場を選択させた後、その他の値の入力に進む形にすればいい
  // 両方やれば実装上も使う側も便利
  // デメリットは、段階を踏むことで煩わしさを感じる恐れがある
  // メリットは、キャンプ場検索用のフォームなどを用意しやすくなる（キャンプ場を選ぶ画面で画面いっぱい使えるため）
}
