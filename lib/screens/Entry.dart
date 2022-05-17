import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Entry extends StatefulWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Journal Entry"),
      ),
      body: ListView(
        children: [
         const TextField(
           textAlign: TextAlign.center,

        decoration: InputDecoration(fillColor: Colors. white, filled: true,hintText: "Title"),


          ),   TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 15,
            decoration: InputDecoration(fillColor: Colors. white, filled: true,hintText: "Journal Entry"),



          ),
        ],
      )

      );
  }
}
