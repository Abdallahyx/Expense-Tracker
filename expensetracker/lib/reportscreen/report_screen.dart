import 'package:flutter/material.dart';
import 'package:expensetracker/mainscreen/bottom_navigation_bar.dart';

class reportPage extends StatefulWidget {
  const reportPage({super.key});

  @override
  report createState() => report();
}

class report extends State<reportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'), // Customize the app bar title
      ),
      body: const Center(
        child: Text('This is a new page!'), // Your page content
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
