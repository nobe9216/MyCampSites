import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_camp_sites/model/camp_site.dart';
import 'package:my_camp_sites/providers/camp_site_service_provider.dart';

final _readOnlyProvider = StateProvider<bool>((ref) => true);

class CampSiteDetailPage extends HookConsumerWidget {
  const CampSiteDetailPage({
    super.key,
    required this.campSite,
  });

  final CampSite campSite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campSiteService = ref.watch(campSiteServiceProvider.future);
    final readOnly = ref.watch(_readOnlyProvider);
    final nameController = TextEditingController(text: campSite.name);
    final addressController = TextEditingController(text: campSite.address);
    final phoneNumberController =
        TextEditingController(text: campSite.phoneNumber);
    final memoController = TextEditingController(text: campSite.memo);
    const labelStyle = TextStyle(
      fontSize: 10,
    );
    final formFieldDecoration = InputDecoration(
      border: readOnly ? InputBorder.none : null,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(campSite.name ?? '名無し'),
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
                  onPressed: () async {
                    if (!readOnly) {
                      // TODO(y.yamanobe): 冗長性解消
                      final campSiteService0 = await campSiteService;
                      campSite.name = nameController.text;
                      campSite.address = addressController.text;
                      campSite.phoneNumber = phoneNumberController.text;
                      campSite.memo = memoController.text;
                      nameController.clear();
                      addressController.clear();
                      phoneNumberController.clear();
                      memoController.clear();
                      campSiteService0.addCampSite(campSite);
                    }
                    ref.read(_readOnlyProvider.notifier).state = !readOnly;
                  },
                  child: Text(readOnly ? '編集' : '保存'),
                ),
              ),
              const Text(
                'キャンプ場名',
                style: labelStyle,
              ),
              TextFormField(
                controller: nameController,
                readOnly: readOnly,
                decoration: formFieldDecoration,
              ),
              const Text(
                '住所',
                style: labelStyle,
              ),
              TextFormField(
                controller: addressController,
                readOnly: readOnly,
                decoration: formFieldDecoration,
              ),
              const Text(
                '電話番号',
                style: labelStyle,
              ),
              TextFormField(
                controller: phoneNumberController,
                readOnly: readOnly,
                decoration: formFieldDecoration,
              ),
              const Text(
                'メモ',
                style: labelStyle,
              ),
              TextFormField(
                controller: memoController,
                readOnly: readOnly,
                decoration: formFieldDecoration,
              ),
              // TODO(y.yamanobe): 削除ボタンを表示すると、この画面に遷移できなくなる
              // const SizedBox(
              //   height: 50,
              // ),
              // _DeleteButton(
              //   campSite: campSite,
              // ),
            ],
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
    final pop = Navigator.pop(context);

    return FilledButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text('削除しますか？'),
            actions: [
              TextButton(
                onPressed: () async {
                  final campSiteService0 = await campSiteService;
                  campSiteService0.removeCampSite(campSite.id);
                  pop;
                },
                child: const Text('はい'),
              ),
              TextButton(
                onPressed: () {
                  pop;
                },
                child: const Text('いいえ'),
              ),
            ],
          ),
        );
      },
      child: const Text('削除'),
    );
  }
}
