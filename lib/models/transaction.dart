class Transaction {
  String title;
  DateTime date = DateTime.now();
  double amount;

  Transaction({this.title = "", this.amount = 0});
}
