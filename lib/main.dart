import 'package:flutter/material.dart';
import 'package:flutter_startup_namer/widgets/list_words.dart';

void main() {
  runApp(const StartupNamer());
}

class StartupNamer extends StatelessWidget {
  const StartupNamer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Startup Name'),
        ),
        body: ListWords(),
      ),
    );
  }
}
