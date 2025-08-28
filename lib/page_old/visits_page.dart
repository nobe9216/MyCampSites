import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:my_camp_sites/components_old/dialogs_old.dart';
import 'package:my_camp_sites/controller_old/visit_input_form_controller.dart';
import 'package:my_camp_sites/model_old/visit.dart';
import 'package:my_camp_sites/page_old/visit_detail_page.dart';
import 'package:my_camp_sites/providers_old/visited_service_provider.dart';
import 'package:my_camp_sites/themes_old/main_theme.dart';
import 'package:my_camp_sites/widgets_old/visit_form.dart';

class VisitsPage extends HookConsumerWidget {
  const VisitsPage({
    super.key,
    required this.isar,
  });

  final Isar isar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitService = ref.watch(visitServiceProvider.future);
    final visitList = ref.watch(visitListProvider.future);
    final inputFormController = ref.watch(visitInputFormProvider.notifier);
    final navigator = Navigator.of(context);

    return MainTheme(
      child: Scaffold(
        appBar: AppBar(title: const Text('訪問実績 一覧')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            inputFormController.reset(Visit());
            navigator.push(
              // TODO(y.yamanobe memo): ダイアログを渡しているから背景が消える、それ以外のwidgetを渡せば背景消えない
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => AddVisitedDialog(
                  inputFormController: inputFormController,
                  title: '訪問実績 追加',
                  buttonLabel: '追加',
                  onPressed: () async {
                    final navigator = Navigator.of(context);
                    await inputFormController.submit();
                    if (visitFormKey.currentState!.validate()) {
                      navigator.pop();
                    }
                  },
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: visitList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final visitList = snapshot.data!;
              return ListView.builder(
                itemCount: visitList.length,
                itemBuilder: (context, index) {
                  final visit = visitList[index];
                  return ListTile(
                    title: (visit.impressions).isEmpty
                        ? const Text('名無し')
                        : Text(visit.impressions),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) => ConfirmationDialog(
                            content: const Text('削除しますか？'),
                            defaultAction: () async {
                              final service = await visitService;
                              service.delete(visit.id!);
                              navigator.pop();
                            },
                            cancelAction: () {
                              navigator.pop();
                            },
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      inputFormController.reset(visit);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisitDetailPage(
                            visit: visit,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text('しばらくお待ちください'),
              );
            }
          },
        ),
      ),
    );
  }
}
