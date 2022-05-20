import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override

   wipePrefs() async {
    final itemList = <String>[];
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (String key in keys) {
      prefs.remove(key);
    }
  }

  Widget build(BuildContext context) {
    return ListView(
      children:  [
        ListTile(
          leading: Text("About"),
        ),
        ListTile(
          leading: Text("Privacy Policy"),
        ),
        ListTile(
          leading: Text("Wipe Journal"),
          onTap: () {
            wipePrefs();
            setState(() {});
          },
        )
      ],
    );
  }
}




