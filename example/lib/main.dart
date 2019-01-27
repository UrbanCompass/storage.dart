//  Copyright © 2019 Compass. All rights reserved.

import 'package:flutter/material.dart';
import 'package:storage/storage.dart';

void main() => runApp(StorageApp());

class StorageApp extends StatefulWidget {
  @override
  _StorageAppState createState() => _StorageAppState();
}

class _StorageAppState extends State<StorageApp> {
  bool _isLoading = true;
  int _fileValue = 0;
  int _memoryValue = 0;
  int _prefsValue = 0;

  final _fileKey = 'fileKey';
  final _memoryKey = 'memoryKey';
  final _prefsKey = 'prefsKey';

  @override
  void initState() {
    Storage.configure().then((configured) {
      Storage.file.getInt(_fileKey).then((value) {
        setState(() {
          _fileValue = value ?? 0;
          _isLoading = false;
        });
      });
      Storage.preferences.getInt(_prefsKey).then((value) {
        setState(() {
          _prefsValue = value ?? 0;
          _isLoading = false;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Storage.dart'),
          ),
          body: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Storage file value $_fileValue'),
                      Text('Storage memory value $_memoryValue'),
                      Text('Storage preferences value $_prefsValue')
                    ],
                  ),
                ),
          floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.storage),
                onPressed: () {
                  _incrementFile();
                },
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                child: Icon(Icons.add_to_queue),
                onPressed: () {
                  _incrementMemory();
                },
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                child: Icon(Icons.playlist_add),
                onPressed: () {
                  _incrementPrefs();
                },
              ),
            ],
          )),
    );
  }

  _incrementFile() async {
    await Storage.file.setInt(_fileKey, _fileValue + 1);
    Storage.file.getInt(_fileKey).then((value) {
      setState(() {
        _fileValue = value;
      });
    });
  }

  _incrementMemory() async {
    await Storage.memory.setInt(_memoryKey, _memoryValue + 1);
    Storage.memory.getInt(_memoryKey).then((value) {
      setState(() {
        _memoryValue = value;
      });
    });
  }

  _incrementPrefs() async {
    await Storage.preferences.setInt(_prefsKey, _prefsValue + 1);
    Storage.preferences.getInt(_prefsKey).then((value) {
      setState(() {
        _prefsValue = value;
      });
    });
  }
}
