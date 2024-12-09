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
  void showRobot(id) {
    var comment = '';

    if (id == 0) {
      comment = 'ログインに成功しました';
    } else if (id == 1) {
      comment = '新規登録に成功しました';
    } else if (id == 2) {
      comment = 'パスワードの変更に成功しました';
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //title: Text('Dialog'),
            content: Text(comment),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('11111'),
            subtitle: Text('080-2222-3333'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              showRobot(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('11111'),
            subtitle: Text('080-2222-3333'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('11111'),
            subtitle: Text('080-2222-3333'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('11111'),
            subtitle: Text('080-2222-3333'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
