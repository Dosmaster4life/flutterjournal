import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Entry.dart';

class JournalList extends StatefulWidget {
  const JournalList({Key? key}) : super(key: key);

  @override
  State<JournalList> createState() => _JournalListState();
}

class _JournalListState extends State<JournalList> {
  final searchController = TextEditingController();
  @override
  String filter = "";

  Future<List<String>> loadPrefs() async { // loads the list of entries
    final itemList = <String>[];
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (String key in keys) {
      if (key != "" && key.toLowerCase().contains(filter.toLowerCase())) {
        itemList.add(key);
      }
    }
    return itemList;
  }

  filterView(String value) { // filters according to search
    setState(() {
      filter = value;
    });
  }

  bool changed = false;

  viewJournal(String info) { // loads journal
    if (info.isEmpty) {
      info = "";
    }
    Navigator.push( // goes to journal view
        context,
        MaterialPageRoute(
          builder: (context) => Entry(
            title: info.isNotEmpty ? info : "",
          ),
        ));
  }

  bool isLoaded = false;
  List data = [];

  Widget build(BuildContext context) { // entry point
    if (data.isEmpty || changed == true) {
      loadPrefs().then((value) => {
            data = value.toList(),
            changed = false,
            setState(() {}),
          });
    }

    return Stack(children: <Widget>[
      Container(
          child: ListView( // list of journal entries
              children: data.map((item) {
        return ListTile(
          onTap: () {
            viewJournal(item);
          },
          leading: Text(item),
        );
      }).toList())),
      Container(
          alignment: Alignment.topRight,
          child: SizedBox(
              width: 150,
              child: TextField( // Search bar
                controller: searchController,
                decoration: new InputDecoration(hintText: 'Search'),
                onChanged: (String value) async {
                  changed = true;
                  filterView(value);
                },
              ))),
    ]);
  }
}
