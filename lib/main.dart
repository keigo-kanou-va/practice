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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
               Navigator.of(context).push<void>( 
               MaterialPageRoute(
               builder: (context) => const DetailPage(),
          ),
        );
            }, 
            child: Text('次へ'),
            )
        ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('詳細ページ'),
        ),
        body: 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return const Detail2Page();
                          },
                          isScrollControlled: true, // フルスクリーンで表示
                        );
                    }, 
                    child: Text('また次へ'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push<void>( 
                      MaterialPageRoute(
                      builder: (context) => const Detail2Page(),
                      ),
                      );// モーダルを閉じる
                    }, 
                    child: Text('戻る'),
                    ),
                ],
              ),
            ),
        );
  }
}

class Detail2Page extends StatelessWidget {
  const Detail2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('最終ページ'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
            Navigator.of(context).pop(); // モーダルを閉じる
            }, 
          child: const Text('終点'),
            ),
        ), 
        );
  }
}