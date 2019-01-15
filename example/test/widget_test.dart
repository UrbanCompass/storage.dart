//  Copyright © 2019 Compass. All rights reserved.

import 'package:flutter_test/flutter_test.dart';

import 'package:storage_example/main.dart';

void main() {
  testWidgets('Verify Platform version', (WidgetTester tester) async {
    await tester.pumpWidget(StorageApp());
  });
}
