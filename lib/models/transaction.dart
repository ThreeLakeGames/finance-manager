class Transaction {
  String title;
  DateTime date = DateTime.now();
  double amount;

  Transaction({this.title = "", this.amount = 0});

  Transaction.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        amount = json["amount"];

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "amount": amount,
    };
  }
}
