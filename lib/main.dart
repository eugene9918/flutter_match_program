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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _textEditingController;
  List<List<int>> _resultList = [
    [0]
  ];
  List<List<int>> _suggestion(int total) {
    if (_is2Pow(total)) {
      int n = _get2Pow(total);

      return [
        [n, 0],
        [n - 2, ...List.generate(pow(2, n - 2).toInt(), (index) => 4)]
      ];
    } else {
      int n = _get2Pow(total);
      int rest = total ~/ pow(2, n);
      if (n == 0) {
        int k = _getSmallest2Pow(rest);
        int tournamentWithDefaultWinGame = k - 1;
        int leagueGame = k - 2;

        
      } else if (rest > 5) {
      } else {
        return [
          [n, ...List.generate(pow(2, n).toInt(), (index) => rest)]
        ];
      }
    }

    return [
      [0]
    ];
  }

  int _getSmallest2Pow(int n) {
    if (n <= 2)
      return 1;
    else {
      int i = 1;
      while (n < pow(2, i)) i++;
      return i;
    }
  }

  int _get2Pow(int n) {
    if (n % 2 != 0)
      return 0;
    else
      return 1 + _get2Pow((n / 2).round());
  }

  bool _is2Pow(int n) {
    if (n <= 1 || n % 2 != 0)
      return false;
    else if (n == 2)
      return true;
    else
      return _is2Pow((n / 2).round());
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _resultList =
                _suggestion(int.parse(_textEditingController.text.trim()));
          });
        },
        child: Icon(Icons.sports_esports_rounded),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: _textEditingController,
            ),
            ..._resultList.map((e) => Text(e.toString()))
          ],
        ),
      ),
    );
  }
}
