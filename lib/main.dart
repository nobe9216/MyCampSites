import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:my_camp_sites/page_old/camp_sites_page.dart';
import 'package:my_camp_sites/page_old/visits_page.dart';
import 'package:my_camp_sites/providers_old/isar_provider.dart';
import 'package:my_camp_sites/strings.dart';
import 'package:my_camp_sites/themes_old/main_theme.dart';

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
      title: Strings.myCampSites,
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
        title: const Text(Strings.myCampSites),
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
              child: const Text('${Strings.campSite}${Strings.list}'),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final isar0 = await isar;
                navigator.push(
                  MaterialPageRoute(
                    builder: (context) => VisitsPage(isar: isar0),
                  ),
                );
              },
              child: const Text('${Strings.visited}${Strings.list}'),
            ),
          ],
        ),
      ),
    );
  }
}
