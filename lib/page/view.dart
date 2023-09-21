import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:my_camp_sites/model/camp_site.dart';

class ViewPage extends StatefulWidget {
  final Isar isar;

  const ViewPage({super.key, required this.isar});

  @override
  ViewPageState createState() => ViewPageState();
}

class ViewPageState extends State<ViewPage> {
  List<CampSite> persons = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await widget.isar.campSites.where().findAll();
    setState(() {
      persons = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('データを表示')),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          final person = persons[index];
          return ListTile(
              title: Text(person.name ?? "値が入ってません"),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await widget.isar.writeTxn(() async {
                    await widget.isar.campSites.delete(person.id);
                  });
                  await loadData();
                },
              ));
        },
      ),
    );
  }
}
