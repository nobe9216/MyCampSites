import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_camp_sites/components/dialogs.dart';
import 'package:my_camp_sites/controller/visit_input_form_controller.dart';
import 'package:my_camp_sites/model/visit.dart';
import 'package:my_camp_sites/providers/visited_service_provider.dart';
import 'package:my_camp_sites/themes/main_theme.dart';
import 'package:my_camp_sites/widgets/visit_form.dart';

final _readOnlyProvider = StateProvider<bool>((ref) => true);

class VisitDetailPage extends HookConsumerWidget {
  const VisitDetailPage({
    super.key,
    required this.visit,
  });

  final Visit visit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputFormController = ref.watch(visitInputFormProvider.notifier);
    final readOnly = ref.watch(_readOnlyProvider);

    return MainTheme(
      child: Scaffold(
        appBar: AppBar(
          title: Text(visit.impressions),
          automaticallyImplyLeading: readOnly,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: FilledButton(
                    onPressed: () {
                      if (readOnly) {
                        ref.read(_readOnlyProvider.notifier).state = !readOnly;
                      }
                      if (!readOnly) {
                        showDialog(
                          context: context,
                          builder: (context) => ConfirmationDialog(
                            content: const Text('保存しますか？'),
                            defaultAction: () async {
                              if (!readOnly) {
                                inputFormController.submit();
                              }
                              ref.read(_readOnlyProvider.notifier).state =
                                  !readOnly;
                              Navigator.pop(context);
                            },
                            cancelAction: () {
                              inputFormController.reset();
                              ref.read(_readOnlyProvider.notifier).state =
                                  !readOnly;
                              Navigator.pop(context);
                            },
                          ),
                        );
                      }
                    },
                    child: Text(readOnly ? '編集' : '保存'),
                  ),
                ),
                Expanded(
                  child: VisitForm(
                    inputFormController: inputFormController,
                    readOnly: readOnly,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                _DeleteButton(
                  visit: visit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DeleteButton extends HookConsumerWidget {
  const _DeleteButton({
    required this.visit,
  });

  final Visit visit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitService = ref.watch(visitServiceProvider.future);
    final navigator = Navigator.of(context);

    return FilledButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => ConfirmationDialog(
            content: const Text('削除しますか？'),
            defaultAction: () async {
              final service = await visitService;
              service.delete(visit.id!);
              navigator.pop();
              navigator.pop();
            },
            cancelAction: () {
              navigator.pop();
            },
          ),
        );
      },
      child: const Text('削除'),
    );
  }
}
