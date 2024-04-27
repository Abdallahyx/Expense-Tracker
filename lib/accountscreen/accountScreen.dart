import 'package:flutter/material.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key? key}) : super(key: key);

  @override
  account createState() => account();
}

class account extends State<accountPage> {
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
