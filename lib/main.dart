// Suggested code may be subject to a license. Learn more: ~LicenseLog:3758837043.
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  //mainでMyAppを呼び出し
  runApp(const MyApp());
}

//MyAppクラスを定義
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //MyAppクラスのwedget build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      //homeはMyHomePageクラスを呼び出し
      home: const ImagePage(),
    );
  }
}

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Image.network(
          'https://1.bp.blogspot.com/-SWOiphrHWnI/XWS5x7MYwHI/AAAAAAABUXA/i_PRL_Atr08ayl9sZy9-x0uoY4zV2d5xwCLcBGAs/s1600/pose_dance_ukareru_man.png',
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  int AI_Number = Random().nextInt(100) + 1;
  String? _message;
  final _controller = TextEditingController();
  int count = 0;

  void _hit() {
    setState(() {
      int? userNumber = int.tryParse(_controller.text);
      if (userNumber == null || userNumber < 1 || userNumber > 100) {
        _message = '正しく入力してください\n（数字の1 - 100のみ有効）';
      } else if (userNumber == AI_Number) {
        count++;
        _message = '正解です！\n${count}回目で当たりました！';
      } else if (userNumber > AI_Number) {
        _message = 'もっと小さいです';
        count++;
      } else {
        _message = 'もっと大きいです';
        count++;
      }
    });
  }

  void _restart() {
    setState(() {
      AI_Number = Random().nextInt(100) + 1;
      _message = null;
      count = 0;
      _controller.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('私が思いつかべている数字を当ててください\n（1 - 100)'),
          if (_message != null)
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(_message!, style: TextStyle(fontSize: 20)),
                    Text('count: $count'),
                  ],
                )),
          TextField(
            decoration: InputDecoration(
              labelText: '数字を入力してください',
              border: OutlineInputBorder(),
            ),
            controller: _controller,
          ),
          ElevatedButton(
            onPressed: () {
              _hit();
            },
            child: Text('送信'),
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () {
              _restart();
            },
            child: Text('リスタート'),
          ),
        ]),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isChecked = false;

  void _ChangeBox() {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:417941161.
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('check'),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:330172529.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: CheckboxListTile(
                title: const Text('check'),
                controlAffinity: ListTileControlAffinity.leading,
                value: isChecked,
                onChanged: (value) {
                  _ChangeBox();
                },
              ),
            ),
            Text('状態：${isChecked}'),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MySlider()),
                  );
                },
                child: Text('次へ'))
          ],
        ),
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _current = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3726094301.
      appBar: AppBar(
        title: const Text('Slider'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Slider(
              value: _current,
              min: 0,
              max: 100,
              label: _current.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _current = value;
                });
              }),
          Text('value = ${_current.round()}'),
        ]),
      ),
    );
  }
}
