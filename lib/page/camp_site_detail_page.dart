import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_camp_sites/components/dialogs.dart';
import 'package:my_camp_sites/controller/camp_site_input_form_controller.dart';
import 'package:my_camp_sites/model/camp_site.dart';
import 'package:my_camp_sites/providers/camp_site_service_provider.dart';
import 'package:my_camp_sites/themes/main_theme.dart';
import 'package:my_camp_sites/widgets/camp_site_form.dart';

final _readOnlyProvider = StateProvider<bool>((ref) => true);

class CampSiteDetailPage extends HookConsumerWidget {
  const CampSiteDetailPage({
    super.key,
    required this.campSite,
  });

  final CampSite campSite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputFormController = ref.watch(campSiteInputFormProvider.notifier);
    final readOnly = ref.watch(_readOnlyProvider);

    return MainTheme(
      child: Scaffold(
        appBar: AppBar(
          title: Text(campSite.name),
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
                  child: CampSiteForm(
                    inputFormController: inputFormController,
                    readOnly: readOnly,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                _DeleteButton(
                  campSite: campSite,
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
    required this.campSite,
  });

  final CampSite campSite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campSiteService = ref.watch(campSiteServiceProvider.future);
    final navigator = Navigator.of(context);

    return FilledButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => ConfirmationDialog(
            content: const Text('削除しますか？'),
            defaultAction: () async {
              final service = await campSiteService;
              service.delete(campSite.id!);
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
