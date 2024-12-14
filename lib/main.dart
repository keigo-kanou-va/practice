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
  List<Map<String, dynamic>> contacts = [
    {'name': 'kego', 'number': '080-2331-9298', 'address': '千葉'},
    {'name': 'kego2', 'number': '090-2331-9298', 'address': '千葉2'},
    {'name': 'kego3', 'number': '000-2331-9298', 'address': '千葉3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index]['name']),
            subtitle: Text(contacts[index]['number']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:596375294.
                  builder: (context) => DetailPage(contact: contacts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4287042695.
    required this.contact,
  });

  final Map<String, dynamic> contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(contact['name']),
      ),
      body: Column(
        children: [
          Text('名前: ${contact['name']}'),
          Text('電話番号: ${contact['number']}'),
          Text('住所: ${contact['address']}'),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('戻る'))
        ],
      ),
    );
  }
}
