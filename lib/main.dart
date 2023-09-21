import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/camp_site.dart';
import 'package:my_camp_sites/page/view.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [CampSiteSchema],
    directory: dir.path,
  );

  runApp(MyApp(isar: isar));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isar});

  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCampSites',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddPage(isar: isar),
    );
  }
}

class AddPage extends StatefulWidget {
  const AddPage({Key? key, required this.isar}) : super(key: key);

  final Isar isar;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('キャンプ場追加'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
            ),
            ElevatedButton(
                onPressed: () async {
                  final campSite = CampSite()..name = nameController.text;
                  nameController.clear();
                  await widget.isar.writeTxn(() async {
                    await widget.isar.campSites.put(campSite);
                  });
                },
                child: const Text('追加')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ViewPage(isar: widget.isar),
                    ),
                  );
                },
                child: const Text('一覧へ'))
          ],
        ),
      ),
    );
  }
}
