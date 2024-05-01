import 'package:flutter/material.dart';
import 'package:expensetracker/reportscreen/report_screen.dart';

import 'main.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFF22303C),
        iconSize: 35,
        selectedItemColor: Colors.white,
        elevation: 3,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyApp()), // Navigate to FirstScreen
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const reportPage()), // Navigate to SecondScreen
              );
              break;
            // Add cases for other screens as needed
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_outlined, color: Colors.white),
            label: '',
          ),
        ],
      ),
    );
  }
}
