class Expense {
  final String name;
  final double amount;
  final String category;
  final DateTime date;

  Expense(this.category, {required this.name, required this.amount, required this.date});
}
