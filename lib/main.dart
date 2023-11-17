import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:my_camp_sites/page/camp_sites_page.dart';
import 'package:my_camp_sites/providers/isar_provider.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 10,
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Camp Sites',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TopPage(),
    );
  }
}

class TopPage extends StatefulHookConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TopPage> createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<TopPage> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isar = ref.watch(isarProvider.future);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final isar0 = await isar;
                navigator.push(
                  MaterialPageRoute(
                    builder: (context) => CampSitesPage(isar: isar0),
                  ),
                );
              },
              child: const Text('キャンプ場一覧'),
            ),
          ],
        ),
      ),
    );
  }
}
