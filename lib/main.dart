import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:my_camp_sites/page/camp_sites_page.dart';
import 'package:my_camp_sites/providers/isar_provider.dart';
import 'package:my_camp_sites/themes/main_theme.dart';

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
      theme: FlexThemeData.light(
        scheme: FlexScheme.green,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.greyLaw,
      ),
      themeMode: ThemeMode.system,
      home: const MainTheme(
        child: TopPage(),
      ),
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
            FilledButton(
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
