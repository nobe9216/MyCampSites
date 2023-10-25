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
    initialValue: CampSite(updatedAt: DateTime.now()),
    onSubmit: (value) async {
      final campSiteService = await ref.watch(campSiteServiceProvider.future);
      campSiteService.addCampSite(value);
    },
    onDelete: (value) async {
      final isar = await ref.watch(isarProvider.future);
      isar.writeTxn(() async {
        await isar.campSites.delete(value.id);
      });
    },
  ),
);

extension CampSiteInputFormController on InputFormController<CampSite> {}
