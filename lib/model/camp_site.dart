import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/camp_site_base.dart';
part 'camp_site.g.dart';
part 'camp_site.freezed.dart';

@freezed
@collection
class CampSite with CampSiteBase, _$CampSite {
  factory CampSite({
    Id? id,
    @Default('') String name,
    @Default('') String prefectureName,
    @Default('') String address,
    @Default('') String phoneNumber,
    @Default('') String memo,
    bool? powerAvailable,
    bool? haveRadioWave,
    @Default('') String offTime,
    @Default('') String checkoutTime,
  }) = _CampSite;

  CampSite._();
}
