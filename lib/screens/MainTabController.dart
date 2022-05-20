import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Entry.dart';
import 'JournalList.dart';
import 'Settings.dart';

class MainTabController extends StatefulWidget {
  const MainTabController({
    Key? key,
  }) : super(key: key);

  @override
  State<MainTabController> createState() => _MainTabControllerState();
}

class _MainTabControllerState extends State<MainTabController> {
  @override
  Widget build(BuildContext context) { // Tab Controller used to switch from listview to settings
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            JournalList(),
            Settings(),
          ],
        ),
        appBar: AppBar(
          toolbarHeight: 1,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Journal", icon: Icon(Icons.accessibility)),
              Tab(text: "Settings", icon: Icon(Icons.settings)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Entry(
                    title: "",
                  ),
                ));
          },
        ),
      ),
    );
  }
}
