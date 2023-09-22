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
                      final campSiteService0 = await campSiteService;
                      campSite.name = nameController.text;
                      campSite.address = addressController.text;
                      campSite.phoneNumber = phoneNumberController.text;
                      nameController.clear();
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
            ],
          ),
        ),
      ),
    );
  }
}
