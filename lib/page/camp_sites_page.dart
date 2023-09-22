import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:my_camp_sites/main.dart';
import 'package:my_camp_sites/model/camp_site.dart';
import 'package:my_camp_sites/page/camp_site_detail_page.dart';
import 'package:my_camp_sites/providers/camp_site_service_provider.dart';
import 'package:my_camp_sites/providers/isar_provider.dart';

class CampSitesPage extends HookConsumerWidget {
  const CampSitesPage({
    super.key,
    required this.isar,
  });

  final Isar isar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isar = ref.watch(isarProvider.future);
    final campSiteService = ref.watch(campSiteServiceProvider.future);
    final campSiteList = ref.watch(campSiteListProvider.future);
    final nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('キャンプ場一覧')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddCampSiteDialog(
            controller: nameController,
            title: 'キャンプ場追加',
            buttonLabel: '追加',
            onPressed: () async {
              final pop = Navigator.pop(context);
              final campSiteService0 = await campSiteService;
              final campSite = CampSite(
                name: nameController.text,
                updatedAt: DateTime.now(),
              );
              nameController.clear();
              campSiteService0.addCampSite(campSite);
              pop;
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
                      final isar0 = await isar;
                      await isar0.writeTxn(() async {
                        await isar0.campSites.delete(campSite.id);
                      });
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
