import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:input_form_controller/input_form_controller.dart';
import 'package:logger/logger.dart';
import 'package:my_camp_sites/controller/camp_site_input_form_controller.dart';
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

class AddCampSiteDialog extends HookConsumerWidget {
  const AddCampSiteDialog({
    super.key,
    required this.textEditingController,
    required this.inputFormController,
    required this.title,
    required this.buttonLabel,
    this.onPressed,
  });

  final TextEditingController textEditingController;
  final InputFormController inputFormController;
  final String title;
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: campSiteFormKey,
      child: AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        content: TextFormField(
          controller: textEditingController,
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
      ),
    );
  }
}
