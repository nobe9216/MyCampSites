import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_camp_sites/controller/camp_site_input_form_controller.dart';
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
    final inputFormController = ref.watch(campSiteInputFormProvider.notifier);
    final readOnly = ref.watch(_readOnlyProvider);
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
          key: campSiteFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: FilledButton(
                  onPressed: () async {
                    if (!readOnly) {
                      inputFormController.submit();
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
                initialValue: campSite.name,
                readOnly: readOnly,
                decoration: formFieldDecoration,
                onSaved: (newValue) {
                  inputFormController
                      .update((currentValue) => currentValue..name = newValue);
                },
              ),
              const Text(
                '住所',
                style: labelStyle,
              ),
              TextFormField(
                initialValue: campSite.address,
                readOnly: readOnly,
                decoration: formFieldDecoration,
                onSaved: (newValue) {
                  inputFormController.update(
                      (currentValue) => currentValue..address = newValue);
                },
              ),
              const Text(
                '電話番号',
                style: labelStyle,
              ),
              TextFormField(
                initialValue: campSite.phoneNumber,
                readOnly: readOnly,
                decoration: formFieldDecoration,
                onSaved: (newValue) {
                  inputFormController.update(
                      (currentValue) => currentValue..phoneNumber = newValue);
                },
              ),
              const Text(
                'メモ',
                style: labelStyle,
              ),
              TextFormField(
                initialValue: campSite.memo,
                readOnly: readOnly,
                decoration: formFieldDecoration,
                onSaved: (newValue) {
                  inputFormController
                      .update((currentValue) => currentValue..memo = newValue);
                },
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
          builder: (context) => AlertDialog(
            content: const Text('削除しますか？'),
            actions: [
              TextButton(
                onPressed: () async {
                  final service = await campSiteService;
                  service.removeCampSite(campSite.id);
                  navigator.pop();
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
      child: const Text('削除'),
    );
  }
}
