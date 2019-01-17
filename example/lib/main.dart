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

  final _fileKey = 'fileKey';
  final _memoryKey = 'memoryKey';

  @override
  void initState() {
    Storage.configure().then((configured) {
      Storage.file.get(_fileKey).then((data) {
        setState(() {
          _fileValue = data?.first ?? 0;
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
                      Text('Storage memory value $_memoryValue')
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
            ],
          )),
    );
  }

  _incrementFile() async {
    await Storage.file.set(_fileKey, [_fileValue + 1]);
    Storage.file.get(_fileKey).then((data) {
      setState(() {
        _fileValue = data.first;
      });
    });
  }

  _incrementMemory() async {
    await Storage.memory.set(_memoryKey, [_memoryValue + 1]);
    Storage.memory.get(_memoryKey).then((data) {
      setState(() {
        _memoryValue = data.first;
      });
    });
  }
}
