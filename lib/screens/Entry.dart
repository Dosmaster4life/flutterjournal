import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Entry extends StatefulWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {

  final titleController = TextEditingController();
  final textController = TextEditingController();

  void dispose() {
    titleController.dispose();
    textController.dispose();

  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text( "Journal Entry"),
      ),
      body: ListView(
        children: [
         TextField(
           controller: titleController,
           textAlign: TextAlign.center,

        decoration: InputDecoration(fillColor: Colors. white, filled: true,hintText: "Title"),


          ),   TextField(
            controller: textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 15,
            decoration: InputDecoration(fillColor: Colors. white, filled: true,hintText: "Journal Entry"),




          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue)
            ),
            onPressed: () {

            },
            child: Text('Save'),
          )
        ],
      )

      );
  }
}
