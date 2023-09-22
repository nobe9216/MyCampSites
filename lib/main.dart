import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_camp_sites/page/camp_sites_page.dart';
import 'package:my_camp_sites/providers/isar_provider.dart';

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
      title: 'MyCampSites',
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
        title: const Text('トップ'),
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
                child: const Text('キャンプ場一覧'))
          ],
        ),
      ),
    );
  }
}

class AddCampSiteDialog extends HookConsumerWidget {
  const AddCampSiteDialog({
    super.key,
    required this.controller,
    required this.title,
    required this.buttonLabel,
    this.onPressed,
  });

  final TextEditingController controller;
  final String title;
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(title),
      content: TextFormField(
        controller: controller,
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
