import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:my_camp_sites/main.dart';
import 'package:my_camp_sites/model/camp_site.dart';
import 'package:my_camp_sites/providers/camp_site_service_provider.dart';
import 'package:my_camp_sites/providers/isar_provider.dart';

class CampSitesPage2 extends StatefulHookConsumerWidget {
  final Isar isar;

  const CampSitesPage2({super.key, required this.isar});

  @override
  CampSitesPageState createState() => CampSitesPageState();
}

class CampSitesPageState extends ConsumerState<CampSitesPage2> {
  List<CampSite> campSites = [];
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await widget.isar.campSites.where().findAll();
    setState(() {
      campSites = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final campSiteService = ref.watch(campSiteServiceProvider.future);

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
              final _campSiteService = await campSiteService;
              final campSite = CampSite(
                name: nameController.text,
                updatedAt: DateTime.now(),
              );
              nameController.clear();
              _campSiteService.addCampSite(campSite);
              pop;
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: campSites.length,
        itemBuilder: (context, index) {
          final campSite = campSites[index];
          return ListTile(
              title: (campSite.name ?? '').isEmpty
                  ? const Text('名無し')
                  : Text(campSite.name!),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await widget.isar.writeTxn(() async {
                    await widget.isar.campSites.delete(campSite.id);
                  });
                  await loadData();
                },
              ));
        },
      ),
    );
  }
}

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
              final _campSiteService = await campSiteService;
              final campSite = CampSite(
                name: nameController.text,
                updatedAt: DateTime.now(),
              );
              nameController.clear();
              _campSiteService.addCampSite(campSite);
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
                        final _isar = await isar;
                        await _isar.writeTxn(() async {
                          await _isar.campSites.delete(campSite.id);
                        });
                      },
                    ));
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
