import 'dart:async';
import 'package:flutter/material.dart';
import 'package:secure_screen_switcher/secure_screen_switcher.dart';

bool? secured = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  secured = await SecureScreenSwitcher.secureApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirstScreen());
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen One"),
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_next),
            tooltip: "next",
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen(false)));
            },
          ),
          IconButton(
            icon: Icon(Icons.replay),
            tooltip: "replace",
            onPressed: () async {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SecondScreen(true)));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('First Screen\n'),
            Text('secured: $secured\n'),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final bool replace;

  SecondScreen(this.replace);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Two"),
        actions: [
          if (this.replace)
            IconButton(
              icon: Icon(Icons.replay),
              tooltip: "replace",
              onPressed: () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FirstScreen()));
              },
            ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('Second Screen\n'),
            Text(replace ? 'screen replaced\n' : 'screen added to stack\n'),
            Text('secured: $secured\n'),
          ],
        ),
      ),
    );
  }
}
