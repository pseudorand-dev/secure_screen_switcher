# secure_screen_switcher

A flutter project to add simple security to flutter mobile apps so that screens are obscured when in the background (switcher) without having to mess with native code

## Usage
In you `main.dart` import the library:
```dart
import 'package:secure_screen_switcher/secure_screen_switcher.dart';
```
and then update:
```dart
void main() => runApp(_App());
```
to
```dart
Future<void> main() async {

  // ensures the app is initialized and method channels can be called prior to runing the app
  WidgetsFlutterBinding.ensureInitialized();

  // turns on the secure_app for ios or android
  secured = await SecureScreenSwitcher.secureApp();

  // run App
  runApp(MyApp());
}
```