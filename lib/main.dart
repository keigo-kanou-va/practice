// Suggested code may be subject to a license. Learn more: ~LicenseLog:3758837043.
import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: _current,
              min: 0,
              max: 100,
              label: _current.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _current = value;
                });
              }
            ),
            Text('value = ${_current.round()}'),
          ]
        ),
      ),
    );
  }
}
