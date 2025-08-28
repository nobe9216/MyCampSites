import 'package:isar/isar.dart';

mixin CampSiteBase {
  Id? id;
  String get name;
  String get prefectureName;
  String get address;
  String get phoneNumber;
  String get memo;
  bool? get powerAvailable;
  bool? get haveRadioWave;
  String get offTime;
  String get checkoutTime;
}
