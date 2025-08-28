import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:input_form_controller/input_form_controller.dart';
import 'package:my_camp_sites/model_old/visit.dart';
import 'package:my_camp_sites/providers_old/isar_provider.dart';
import 'package:my_camp_sites/providers_old/visited_service_provider.dart';

final visitFormKey = GlobalKey<FormState>();

final visitInputFormProvider = StateNotifierProvider.autoDispose<
    InputFormController<Visit>, InputFormState<Visit>>(
  (ref) => InputFormController<Visit>(
    formKey: visitFormKey,
    initialValue: Visit(),
    onSubmit: (value) async {
      final visitService = await ref.read(visitServiceProvider.future);
      await (value.id == null
          ? visitService.create
          : visitService.update)(value);
    },
    onDelete: (value) async {
      final isar = await ref.read(isarProvider.future);
      isar.writeTxn(() async {
        await isar.visits.delete(value.id!);
      });
    },
  ),
);
