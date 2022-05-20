import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainTabController.dart';

class FlutterJoural extends StatefulWidget {
  const FlutterJoural({Key? key}) : super(key: key);

  @override
  State<FlutterJoural> createState() => _FlutterJouralState();
}

class _FlutterJouralState extends State<FlutterJoural> {
  @override
  Widget build(BuildContext context) { // Starts the app
    return MaterialApp(
      home: MainTabController(),
    );
  }
}
