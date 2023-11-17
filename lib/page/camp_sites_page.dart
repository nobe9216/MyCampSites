import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:input_form_controller/input_form_controller.dart';
import 'package:isar/isar.dart';
import 'package:my_camp_sites/controller/camp_site_input_form_controller.dart';
import 'package:my_camp_sites/model/camp_site.dart';
import 'package:my_camp_sites/page/camp_site_detail_page.dart';
import 'package:my_camp_sites/providers/camp_site_service_provider.dart';

class CampSitesPage extends HookConsumerWidget {
  const CampSitesPage({
    super.key,
    required this.isar,
  });

  final Isar isar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campSiteService = ref.watch(campSiteServiceProvider.future);
    final campSiteList = ref.watch(campSiteListProvider.future);
    final inputFormController = ref.watch(campSiteInputFormProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('キャンプ場 一覧')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddCampSiteDialog(
            inputFormController: inputFormController,
            title: 'キャンプ場 追加',
            buttonLabel: '追加',
            onPressed: () async {
              final navigator = Navigator.of(context);
              await inputFormController.submit();
              navigator.pop();
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: campSiteList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('取得失敗'),
            );
          } else if (snapshot.hasData) {
            final campSiteList = snapshot.data!;
            return ListView.builder(
              itemCount: campSiteList.length,
              itemBuilder: (context, index) {
                final campSite = campSiteList[index];
                return ListTile(
                  title: (campSite.name ?? '').isEmpty
                      ? const Text('名無し')
                      : Text(campSite.name!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      final campSiteService0 = await campSiteService;
                      campSiteService0.removeCampSite(campSite.id);
                    },
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CampSiteDetailPage(
                        campSite: campSite,
                      ),
                    ),
                  ),
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
    );
  }
}

class AddCampSiteDialog extends HookConsumerWidget {
  const AddCampSiteDialog({
    super.key,
    required this.inputFormController,
    required this.title,
    required this.buttonLabel,
    this.onPressed,
  });

  final InputFormController<CampSite> inputFormController;
  final String title;
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      content: Form(
        key: campSiteFormKey,
        child: TextFormField(
          onSaved: (newValue) {
            // TODO(y.yamanobe):
            // ref.read(initialCampSiteProvider.notifier).update(CampSite());
            inputFormController.update(
              (currentValue) => currentValue..name = newValue,
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(buttonLabel),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('戻る'),
        ),
      ],
    );
  }
}
