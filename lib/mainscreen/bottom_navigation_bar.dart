import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  // final int selectedIndex;
  // final Function(int) onItemTapped;
  //
  // CustomBottomNavigationBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      child: BottomNavigationBar(
        backgroundColor: Color(0xFF22303C),
        iconSize: 35,
        selectedItemColor: Colors.white,
        elevation: 3,
        // currentIndex: selectedIndex,
        // onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_sharp),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: '',
          ),
        ],

      ),


    );


  }
}
