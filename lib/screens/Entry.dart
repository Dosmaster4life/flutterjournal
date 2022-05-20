import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Entry extends StatefulWidget {
  final String title;

  const Entry({Key? key, required this.title}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  final titleController = TextEditingController(); // used to look for text changes
  final textController = TextEditingController();

  void dispose() {
    titleController.dispose();
    textController.dispose();
  }

  Future<void> saveFile() async { // saves to a file
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(titleController.text, textController.text);
  }

  Future<void> loadFile() async { // loads the file
    if (widget.title != "") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      titleController.text = widget.title;
      String data = prefs.getString(widget.title)!;
      if (data.isNotEmpty) {
        textController.text = data;
      }
    }
  }

  Widget build(BuildContext context) { // code entry point
    loadFile();

    return Scaffold(
        appBar: AppBar(
          title: Text("Journal Entry"),
        ),
        body: ListView(
          children: [
            TextField(
              controller: titleController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  fillColor: Colors.white, filled: true, hintText: "Title"),
            ),
            TextField(
              controller: textController,
              keyboardType: TextInputType.multiline,
              maxLines: 15,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Journal Entry"),
            ),
            TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlue)),
              onPressed: () {
                saveFile();
              },
              child: Text('Save'),
            )
          ],
        ));
  }
}
