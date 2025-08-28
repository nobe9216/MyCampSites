import 'package:isar/isar.dart';
import 'package:my_camp_sites/model_old/evaluation.dart';

mixin VisitBase {
  Id? id;
  DateTime? get visitedDate;
  int get campSiteId;
  int get accommodationFee;
  int get transportationFee;
  int get foodCosts;
  int get incidentalExpenses;
  String get weather;
  int get lengthOfStay;
  String get impressions;
  Evaluation get evaluations;
}
