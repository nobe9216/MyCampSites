import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:input_form_controller/input_form_controller.dart';
import 'package:isar/isar.dart';
import 'package:my_camp_sites/controller/camp_site_input_form_controller.dart';
import 'package:my_camp_sites/model/camp_site.dart';
import 'package:my_camp_sites/page/camp_site_detail_page.dart';
import 'package:my_camp_sites/providers/camp_site_service_provider.dart';
import 'package:my_camp_sites/themes/main_theme.dart';

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
    final navigator = Navigator.of(context);

    return MainTheme(
      child: Scaffold(
        appBar: AppBar(title: const Text('キャンプ場 一覧')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            inputFormController.reset(CampSite());
            showDialog(
              context: context,
              builder: (context) {
                return AddCampSiteDialog(
                  inputFormController: inputFormController,
                  title: 'キャンプ場 追加',
                  buttonLabel: '追加',
                  onPressed: () async {
                    final navigator = Navigator.of(context);
                    await inputFormController.submit();
                    navigator.pop();
                  },
                );
              },
            );
          },
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
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text('削除しますか？'),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  final service = await campSiteService;
                                  service.delete(campSite.id);
                                  navigator.pop();
                                },
                                child: const Text('はい'),
                              ),
                              TextButton(
                                onPressed: () {
                                  navigator.pop();
                                },
                                child: const Text('いいえ'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      inputFormController.reset(campSite);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CampSiteDetailPage(
                            campSite: campSite,
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
    const labelStyle = TextStyle(
      fontSize: 10,
    );
    const formFieldDecoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
    );
    const gap = SizedBox(
      height: 30,
    );

    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      content: Form(
        key: campSiteFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'キャンプ場名',
              style: labelStyle,
            ),
            TextFormField(
              decoration: formFieldDecoration,
              onSaved: (newValue) {
                inputFormController
                    .update((currentValue) => currentValue..name = newValue);
              },
            ),
            gap,
            const Text(
              '住所',
              style: labelStyle,
            ),
            TextFormField(
              decoration: formFieldDecoration,
              onSaved: (newValue) {
                inputFormController
                    .update((currentValue) => currentValue..address = newValue);
              },
            ),
            gap,
            const Text(
              '電話番号',
              style: labelStyle,
            ),
            TextFormField(
              decoration: formFieldDecoration,
              onSaved: (newValue) {
                inputFormController.update(
                    (currentValue) => currentValue..phoneNumber = newValue);
              },
            ),
            gap,
            const Text(
              'メモ',
              style: labelStyle,
            ),
            TextFormField(
              decoration: formFieldDecoration,
              onSaved: (newValue) {
                inputFormController
                    .update((currentValue) => currentValue..memo = newValue);
              },
            ),
          ],
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
