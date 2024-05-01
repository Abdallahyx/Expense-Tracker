import 'package:flutter/material.dart';
import 'package:expensetracker/expensesScreen/expenses_model.dart';

class list_tile extends StatelessWidget {
  const list_tile({super.key, required this.history, required this.index});
  final Expense_model history;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: get(index, history));
  }

  get(int index, Expense_model history) {
    return ListTile(
      leading: const Icon(
        Icons.monetization_on,
        size: 35,
      ),
      title: Text(
        history.category,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 20,
          color: Color(0xFF1D267D),
        ),
      ),
      subtitle: Text(
        history.description,
        style: const TextStyle(fontSize: 15),
      ),
      trailing: Text(
        history.amount.toString(),
        style: const TextStyle(fontSize: 20),
      ),
      tileColor: Colors.white,
    );
  }
}
