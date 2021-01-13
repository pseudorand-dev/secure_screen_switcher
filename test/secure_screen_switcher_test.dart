import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secure_screen_switcher/secure_screen_switcher.dart';

void main() {
  const MethodChannel channel = MethodChannel('secure_screen_switcher');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('secureApp', () async {
    expect(await SecureScreenSwitcher.secureApp(), true);
  });
}
