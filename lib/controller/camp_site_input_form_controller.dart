import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:input_form_controller/input_form_controller.dart';
import 'package:my_camp_sites/model/camp_site.dart';
import 'package:my_camp_sites/providers/isar_provider.dart';

import '../providers/camp_site_service_provider.dart';

final campSiteFormKey = GlobalKey<FormState>();

final campSiteInputFormProvider = StateNotifierProvider.autoDispose<
    InputFormController<CampSite>, InputFormState<CampSite>>(
  (ref) => InputFormController<CampSite>(
    formKey: campSiteFormKey,
    initialValue: CampSite(),
    // TODO(y.yamanobe):
    // initialValue: ref.watch(initialCampSiteProvider),
    onSubmit: (value) async {
      final campSiteService = await ref.read(campSiteServiceProvider.future);
      campSiteService.addCampSite(value);
    },
    onDelete: (value) async {
      final isar = await ref.read(isarProvider.future);
      isar.writeTxn(() async {
        await isar.campSites.delete(value.id);
      });
    },
  ),
);

extension CampSiteInputFormController on InputFormController<CampSite> {}

final initialCampSiteProvider =
    StateNotifierProvider<InitialCampSiteNotifier, CampSite>(
        (ref) => InitialCampSiteNotifier(
              emptyData: CampSite(),
            ));

class InitialCampSiteNotifier extends StateNotifier<CampSite> {
  InitialCampSiteNotifier({
    required this.emptyData,
  }) : super(emptyData);
  final CampSite emptyData;

  void update(CampSite data) => state = data;
}
