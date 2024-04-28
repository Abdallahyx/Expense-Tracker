import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:software_project/expensesScreen/expenses_model.dart';
import 'package:software_project/mainscreen/tile_widget.dart';
import 'appbar.dart';
import 'bottom_navigation_bar.dart';
import 'box.dart';
import 'floating_button.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ExpensemodelAdapter());
  await Hive.openBox<Expense_model>('expenses');
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),)

  );
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var history;
  final box = Hive.box<Expense_model>('expenses');

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.grey.shade100,
        body:ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: ( context, value, child) {
           return Column(
              children: [
                TotalBalanceWidget(),
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
                        onTap: () {},
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
                const SizedBox(height: 10),
                Expanded(
                    child: ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, int index) {
                        history = box.values.toList()[index];
                        return Container(
                          child: Card(
                            child: list_tile(history: history, index: index,),
                          ),
                        );
                      },
                    )
                )
              ], //list items must be added
            );
          }),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFloatingActionButton(),

    )
    ;}}