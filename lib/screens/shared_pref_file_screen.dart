import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Screen',
      home: FlutterDemo(storage: NumberStorage(), title: 'Share preferences demo'),
    );
  }
}

class NumberStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/number.txt');
  }

  Future<int> readNumber() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeNumber(int number) async {
    final file = await _localFile;
    return file.writeAsString('$number');
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage, required this.title}) : super(key: key);

  final NumberStorage storage;
  final String title;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _number = 0;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
    widget.storage.readNumber().then((int value) {
      setState(() {
        _number = value;
      });
    });
  }

  Future<File> _incrementNumber() {
    setState(() {
      _number++;
    });
    return widget.storage.writeNumber(_number);
  }

  void _loadCounter() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) +1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo Screen'),
          ),
          body: Center(
            child: Column(children: [
              SizedBox(height: 150,),
              Text('You have pushed the button this many times:',),
              Text('$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
              ElevatedButton(
                onPressed:  _incrementCounter,
                child: Text('Shared preference'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                ),
              ),

              SizedBox(height: 150,),
              Text(
              'Button tapped $_number time${_number == 1 ? '' : 's'}.',
            ),
              ElevatedButton(
                onPressed:  _incrementNumber,
                child: Text('File'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),),
                ),
              ),
          ],),
        ),
      ),
    );
  }
}



