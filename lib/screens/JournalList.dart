

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

  Future<List<String>> loadPrefs() async {
    final itemList = <String>[];
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    final prefsMap = <String, dynamic>{};
    for (String key in keys) {
      prefsMap[key] = prefs.get(key);
      if (prefsMap[key] != "" && prefsMap[key].toString().contains(filter)) {
        print(filter);
        itemList.add(prefsMap[key]);
      }
    }
    return itemList;
  }

  filterView(String value) {

    setState(() {filter = value;});
  }
  bool changed = false;
  viewJournal(String info) {
    if (info.isEmpty) {
      info = "";
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Entry(title: info.isNotEmpty ? info : "",),
        ));
  }

  bool isLoaded = false;
  List data = [];

  Widget build(BuildContext context) {
    if (data.isEmpty || changed == true) {
      loadPrefs().then((value) =>
      {
        data = value.toList(),
        changed = false,
        setState(() {}),
      });
    }

      return Stack(

          children: <Widget>[
           Container(child:  ListView(
                children: data.map((item) {
                  return ListTile(
                    onTap: () {viewJournal(item);},
                  leading: Text(item),
                  );}).toList()


            )),Container(
              alignment: Alignment.topRight,
                child: SizedBox(
              width: 150 ,
                child: TextField(
              controller: searchController,

              onChanged: (String value) async {
                changed = true;
                filterView(value);
              },

            ))),

          ]);

      return Container(
          alignment: Alignment.topRight,
          child: SizedBox(
              width: 150 ,
              child: TextField(
                controller: searchController,

                onChanged: (String value) async {
                  changed = true;
                  filterView(value);
                },

              )));


  }
}
