//  Copyright © 2019 Compass. All rights reserved.

import 'dart:async';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:storage/file_storage.dart';
import 'package:storage/memory_storage.dart';
import 'package:storage/mocks/mock_secure.dart';
import 'package:storage/preferences_storage.dart';
import 'package:storage/secure_storage.dart';

export 'file_storage.dart';
export 'memory_storage.dart';
export 'preferences_storage.dart';
export 'secure_storage.dart';
export 'storage_container.dart';

class Storage {
  static bool _configured = false;
  static FileStorage _fileStorage;
  static MemoryStorage _memoryStorage;
  static PreferencesStorage _preferencesStorage;
  static SecureStorage _secureStorage;

  static bool get isConfigured => _configured;

  static FileStorage get file {
    _verifyConfigured();
    return _fileStorage;
  }

  static MemoryStorage get memory {
    _verifyConfigured();
    return _memoryStorage;
  }

  static PreferencesStorage get preferences {
    _verifyConfigured();
    return _preferencesStorage;
  }

  static SecureStorage get secure {
    _verifyConfigured();
    return _secureStorage;
  }

  static Future<bool> configure({bool testing = false}) async {
    Directory fileStorageDirectory;

    if (testing == true) {
      fileStorageDirectory =
          await Directory.systemTemp.createTemp('__file_storage_test__');
    } else {
      fileStorageDirectory = await getTemporaryDirectory();
    }

    _fileStorage = FileStorage(fileStorageDirectory.path);
    _memoryStorage = MemoryStorage();
    _preferencesStorage =
        PreferencesStorage(prefs: await SharedPreferences.getInstance());

    if (testing) {
      _secureStorage = SecureStorage(storage: MockSecure());
    } else {
      _secureStorage = SecureStorage(storage: FlutterSecureStorage());
    }

    _configured = true;
    return _configured;
  }

  static resetConfiguration() {
    _fileStorage = null;
    _memoryStorage = null;
    _configured = false;
  }

  static _verifyConfigured() {
    if (!_configured) {
      throw StateError(
          "Storage isn't configured. Please call Storage.configure() before using.");
    }
  }
}
