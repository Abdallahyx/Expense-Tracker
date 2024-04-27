import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../mainscreen/bottom_navigation_bar.dart';
import 'dropdown_menu.dart';
import 'func_to_add_expenses.dart';
class Expense {
  final String name;
  final double amount;
  final String category;
  final DateTime date;

  Expense(this.category, {required this.name, required this.amount, required this.date});
}

class expensesPage extends StatefulWidget {
  const expensesPage({Key? key}) : super(key: key);

  @override
  expenses createState() => expenses();
}

class expenses extends State<expensesPage> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  String selectedOption='select category' ;
  List<String> options = [
    'select category',
    'food'
  ];

  void initState() {
    super.initState();
    dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor:Colors.grey.shade100,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                const Text("ADD ",style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 70),
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(70)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70),
                      borderSide: BorderSide(color: Colors.black), // Color of the outline border when enabled
                    ),
                    hintText: "please enter Description",
                    labelText: "Description",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                    fillColor: Colors.black,
                    prefixIconColor: Colors.black,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70),
                        borderSide: BorderSide(color: Colors.black), // Color of the outline border when enabled
                      ),
                      hintText: "please enter your amount of expense",
                      hintStyle: TextStyle(color: Colors.black),
                      labelText: "amount",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.monetization_on),
                      fillColor: Colors.black,
                      prefixIconColor: Colors.black,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ]),
                SizedBox(height: 40), // Adjust spacing as needed
                TextField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    hintText: "Select Date",
                    labelText: "Date",
                    labelStyle: const TextStyle(color: Colors.black),
                    prefixIcon: const Icon(Icons.calendar_today),
                    fillColor: Colors.black,
                    prefixIconColor: Colors.black,
                  ),
                ),
                SizedBox(height:40),
                SingleChildScrollView(
                  child: CustomDropdownMenu(
                      options: options,
                      onChanged: (String newValue) {
                        setState(() {
                          if (newValue == 'select category') {
                            showAddItemDialog(context, options, selectedOption, (String newItem) {
                              setState(() {
                                selectedOption = newItem;
                              });
                            });
                          }
                        });}, intial_value: 'select category', ),
                )

              ],
            ),
          ),
        ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}