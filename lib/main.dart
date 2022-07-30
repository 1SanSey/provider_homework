import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Homework',
      home: ChangeNotifierProvider<SwitchProvider>.value(
        value: SwitchProvider(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SwitchProvider _state = Provider.of<SwitchProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Provider Homework',
          style: TextStyle(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              width: 200.0,
              height: 200.0,
              duration: const Duration(seconds: 1),
            ),
            Switch(
                value: _state.switchValue,
                onChanged: (value) {
                  _state._changeSwitchState();
                  value = _state.switchValue;
                }),
          ],
        ),
      ),
    );
  }
}

class SwitchProvider extends ChangeNotifier {
  bool _switch = false;
  bool get switchValue => _switch;

  void _changeSwitchState() {
    _switch == false ? _switch = true : _switch = false;
    notifyListeners();
  }
}
