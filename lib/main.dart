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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//MyHomePageクラスを定義
//ステートフルWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//_MyHomePageStateを定義
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Image.network('https://s.animeanime.jp/imgs/p/X2bKTbbkhKNuuQZDts1HWTagH66grq_oqaqr/303592.jpg',
                width: 300,
        ),
      ),
    );
  }
}
