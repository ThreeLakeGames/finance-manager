class Transaction {
  String title;
  DateTime date = DateTime.now();
  double amount;

  Transaction({
    this.title = "",
    this.amount = 0,
    this.date,
  });

  Transaction.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        amount = json["amount"],
        date = DateTime.tryParse(json["date"]);

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "amount": amount,
      "date": date.toIso8601String(),
    };
  }

  bool get isIncome {
    if (amount > 0) {
      return true;
    } else {
      return false;
    }
  }
}
