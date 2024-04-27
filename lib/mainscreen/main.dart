import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import 'bottom_navigation_bar.dart';
import 'box.dart';
import 'floating_bottom.dart';
import '../expensesScreen/expenses_screen.dart';

void main() {
  runApp(const MaterialApp(
    // debugShowCheckedModeBanner: true,
    home: MyApp(),)

  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.grey.shade100,
        body:Column(
          children: [
            const TotalBalanceWidget(),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],//list items must be added
        ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFloatingActionButton(),

    )
    ;}}