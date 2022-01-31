class WalletTransaction {
  final int? id;
  final String descriptions;

  WalletTransaction({this.id, required this.descriptions});

  WalletTransaction.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        descriptions = res["descriptions"];

  Map<String, Object?> toMap() {
    return {'id': id, 'descriptions': descriptions};
  }
}
