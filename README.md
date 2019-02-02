[![bitrise](https://app.bitrise.io/app/dd31a8bace658d96/status.svg?token=nPMahPdU4U5Rn65wKeOI8g&branch=master)](https://travis-ci.org/UrbanCompass/storage.dart)
[![codecov](https://codecov.io/gh/UrbanCompass/storage.dart/branch/master/graph/badge.svg)](https://codecov.io/gh/UrbanCompass/storage.dart)

# storage.dart

A flutter plugin for storing things :)

## Purpose

A standard [interface](/lib/storage_container.dart) for common storage mechanisms in flutter. Currently supports `file`, `memory`, `preferences`, and `secure` storage options.

## Getting started

### Installation

Add `storage` as a [dependency in you pubspec.yaml file](https://flutter.io/docs/development/packages-and-plugins/using-packages)

### Usage

#### Static interface

`storage` must be configured before it can be used. This is required to initialize some of the various storage mechanisms like `path_provider` and `shared_preferences`.

- Configure

  ```dart
  await Storage.configure();
  ```

- Available storage containers

  ```dart
  Storage.file
  Storage.memory
  Storage.preferences
  Storage.secure
  ```

- Setting values (file storage)

  ```dart
  await Storage.file.setBool('some key', true);
  await Storage.file.setString('some key', true);
  await Storage.file.setInt('some key', true);
  await Storage.file.setDouble('some key', true);
  await Storage.file.setMap('some key', true);
  await Storage.file.setData('some key', true);
  ```

- Getting values (file storage)

  ```dart
  final boolValue = await Storage.file.getBool('some key');
  final stringValue = await Storage.file.getString('some key');
  final intValue = await Storage.file.getInt('some key');
  final doubleValue = await Storage.file.getDouble('some key');
  final mapValue = await Storage.file.getMap('some key');
  final dataValue = await Storage.file.getData('some key');
  ```

- Check if value exists (file storage)
  ```dart
  final exists = await Storage.file.exists('some key');
  ```

#### Example

```dart
import 'package:flutter/material.dart';
import 'package:storage/storage.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
      child: RaisedButton(
        onPressed: _incrementCounter,
        child: Text('Increment Counter'),
        ),
      ),
    ),
  ));
}

_incrementCounter() async {
  if (!Storage.isConfigured) {
      await Storage.configure()
  }
  int counter = (await Storage.file.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  await Storage.file.setInt('counter', counter);
}
```
