import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burung Nias',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Burung Nias'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> _burungNias = ["Beo", "Buru'u", "Magio", "Nagoyomanase", "Towi-towi", "Nazese", "Gogowaya", "Miti-miti", "Siliŵi", "Boroa"];
  String _burungPilihan = "Beo";

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter < _burungNias.length) {
        _burungPilihan = _burungNias[_counter];
      }
      else {
        _counter = 0;
        _burungPilihan = _burungNias[_counter];
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;

      if (_counter >= 0) {
        _burungPilihan = _burungNias[_counter];
      }
      else {
        _counter = _burungNias.length - 1;
        _burungPilihan = _burungNias[_counter];
      }
    });
  }

  void _sembarangBurung() {
    setState(() {
      _counter = Random().nextInt(9) + 1;
      _burungPilihan = _burungNias[_counter];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Burung pilihan Anda: ',
            ),
            Text(
              '$_burungPilihan',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _decrementCounter, child: Text('<'),),
                SizedBox(width: 50,),
                ElevatedButton(onPressed: _incrementCounter, child: Text('>'),),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sembarangBurung,
        tooltip: 'Increment',
        child: Icon(Icons.shuffle),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
