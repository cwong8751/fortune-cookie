import 'dart:js_interop';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fortune_cookie/providers/FortuneModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => FortuneModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  String _currentFortune = "";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentFortune = "";

  final _fortuneList = [
    "You will find a new friend",
    "You will find a new friend tomorrow",
    "A truly rich life contains love and art in abundance",
    "Accept something that you cannot change",
    "Adventure can be real happiness",
    "Advice is like kissing",
    "Advice, when most needed, is least needed",
    "Spread love everywhere you go",
    "Well done is better than well said",
    "Do one thing every day that scares you"
  ];

  @override
  Widget build(BuildContext context) {
    final fortune = Provider.of<FortuneModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/fortune_cookie.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  fortune.currentFortune,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => fortune.getNewFortune,
                child: const Text('Get fortune'))
          ],
        ),
      ),
    );
  }
}
