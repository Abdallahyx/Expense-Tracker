import 'package:flutter/material.dart';

class reportPage extends StatefulWidget {
  const reportPage({Key? key}) : super(key: key);

  @override
  report createState() => report();
}

class report extends State<reportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'), // Customize the app bar title
      ),
      body: Center(
        child: Text('This is a new page!'), // Your page content
      ),
    );
  }
}
