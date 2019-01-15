//  Copyright © 2019 Compass. All rights reserved.

import 'package:flutter/material.dart';

void main() => runApp(StorageApp());

class StorageApp extends StatefulWidget {
  @override
  _StorageAppState createState() => _StorageAppState();
}

class _StorageAppState extends State<StorageApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Storage example app'),
        ),
        body: Center(
          child: Text('Storage sample'),
        ),
      ),
    );
  }
}
